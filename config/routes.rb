Rails.application.routes.draw do
  root to: "home#index"

  get :to_json, to: "home#to_json"
  get :to_csv, to: "home#to_csv"

end
