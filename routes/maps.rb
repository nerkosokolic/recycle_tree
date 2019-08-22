get '/map' do
    @item = params[:item]
    @location = params[:location]
    erb :map
end