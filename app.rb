require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:home)

end

get("/random/new") do

  erb(:random_new)

end


get("/random/results") do

  @user_min = params.fetch("user_min").to_f
  @user_max = params.fetch("user_max").to_f

  @random_number = rand(@user_min..@user_max)

  erb(:random_result)

end

get("/square/new") do

  erb(:square_new)

end


get("/square/results") do

  @number = params.fetch("number").to_f

  @squared_number = @number**2

  erb(:square_result)

end

get("/square_root/new") do

  erb(:square_root_new)

end


get("/square_root/results") do

  @user_number = params.fetch("user_number").to_f

  @square_root_number = @user_number**0.5

  erb(:square_root_results)

end


get("/payment/new") do

  erb(:payment_new)

end


get("/payment/results") do

  @user_apr = params.fetch("user_apr").to_f / (100*12)
  @user_years = params.fetch("user_years").to_i
  user_months = @user_years * 12
  @user_pv = params.fetch("user_pv").to_f

  numerator = @user_apr * @user_pv
  denominator = 1 - (1 + @user_apr)**(-user_months)

  @user_payment = numerator / denominator
  @user_payment = @user_payment.round(2)

  erb(:payment_results)

end
