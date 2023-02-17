class HomeController < ApplicationController
  around_action :sync_coin_price
  before_action :calculate_investment

  def to_csv
    attributes = %w{mes eth btc}

    csv_data = CSV.generate(headers: true) do |csv|
      csv << attributes

      @investment.monthly_projection do |month, index|
        csv << [index, month[:eth_usd_earnings], month[:btc_usd_earnings]]
      end
    end

    send_data csv_data, filename: "monthly_projection_calculator.csv"
  end

  def to_json
    investment_values = []

    @investment.monthly_projection do |month, index|
      investment_values[index] = { month: index, eth: month[:eth_usd_earnings], btc: month[:btc_usd_earnings] }
    end

    render json: investment_values.compact
  end

  private

  def calculate_investment
    coin_data = CryptoCoin.instance
    @initial_investment = params.dig(:calculation, :initial_investment) || 0.0
    @investment = InvestmentCalculationService.call(coin_data, @initial_investment)
  end

  def sync_coin_price
    yield
    SyncCoinPriceService.call(CryptoCoin.instance)
  end
end
