require 'sinatra'

PAY_PER_TAN = 15
PAY_PER_EXPRESS_TAN = 20

get '/' do
  erb :index
end

def calculate_pay(params)
  [
    (params['tan_count'].to_i * PAY_PER_TAN),
    (params['express_tan_count'].to_i * PAY_PER_EXPRESS_TAN),
    params['travel_fee'].to_f,
    params['tips'].to_f
  ].sum
end

post '/' do
  @total_pay = calculate_pay(params)

  erb :index
end