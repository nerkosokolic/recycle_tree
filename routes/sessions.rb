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

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end