get '/my_account' do
  user = User.find(session[:user_id])
  @user = user.username
  @user_listings = Listing.where(user_id: user.id)
  @category = Category.all
  erb :my_account
end

get '/signup' do
    erb :signup
end


put '/my_account/:id' do
    @user = User.find(params[:user_id])
    @user.username = User.find(params[:username])
    @user.email = params[:email]
    @user.save
    redirect '/my_account'
end