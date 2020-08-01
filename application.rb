require 'pry'
require 'sinatra'

PAY_PER_TAN = 15
PAY_PER_EXPRESS_TAN = 20

get '/' do
  # 'Hello world!'
  erb :index
end

post '/' do
  # binding.pry
  @total_pay = 0
  @total_pay += params['tan_count'].to_i * PAY_PER_TAN
  @total_pay += params['express_tan_count'].to_i * PAY_PER_EXPRESS_TAN
  @total_pay += params['travel_fee'].to_i
  @total_pay += params['tips'].to_f

  erb :index
end