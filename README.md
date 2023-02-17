# Calculadora de inversion a 12 meses.


1. Crear una aplicación para calcular una inversión en USD.
2. La aplicación tiene 2 monedas para proyectar: Bitcoin y Ethereum
3. Cada moneda tendrá un interés mensual: BTC 5% Y ETH 3%
4. Debes obtener el precio en USD en tiempo real (API: COINMARKETCAP, BINANCE, MESSARI)
5. El usuario debe ingresar un monto en USD y la aplicación debe mostrar una proyección mensual
y anual tomando en cuenta los valores de interés de cada moneda.
(BTC: 59000 USD / ETH: 4462 USD)

INVERSION 500 USD
BTC ETH
MES1 $$ / BTC MES1 $$ /ETH
MES2
MES3
.... ...
MES12 $$ MES12 $$

6. El resultado de la proyección debe mostrarse en una tabla y exportarse a CSV/JSON
7. La aplicación debe mostrar en tiempo real los precios de ambas monedas BTC y ETH (BTC:
59000 USD / ETH: 4462 USD)

--Detalle del desarrollo

Ruby on Rails 6.1.7.2
dev DB on sqlite
prod DB mySql 
api coin market cap : https://pro-api.coinmarketcap.com

Se levanto en Digital Ocean para revision 
https://seahorse-app-rxxno.ondigitalocean.app/
