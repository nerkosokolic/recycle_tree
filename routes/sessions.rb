get '/login' do
    erb :login
  end
  
post '/session' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id 
    redirect "/"
  else
    nil 
  end
end

delete '/session' do
  # destroy the session
  session[:user_id] = nil
  redirect '/'
end