get '/messages' do
    @msg = Message.all
    erb :message
  end