get '/login' do
  erb :login
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password_digest])
    session[:user_id] = user.id 
    redirect "/"
  else
    nil
  end
end

post '/signup' do
  user = User.new
  user.email = params[:email]
  user.username = params[:username]
  user.mobile_number = params[:mobile]
  user.password_digest = params[:password]
  user.save
  session[:user_id] = user.id
  redirect '/'
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end
