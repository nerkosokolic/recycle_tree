get '/show' do
    erb :show
end

get '/listings' do
    @search_term = params[:item]
    @location = params[:location]
    @category = params[:category]
    erb :listings
end

get '/give_success' do
    erb :give_success
end

get '/give_form' do
    
    @search_term = params[:item]
    erb :give_form
end

get '/give_preview' do
    @title = params[:title]
    @category = params[:category]
    @description = params[:description]
    @image = params[:image_url]
    erb :give_preview
end

post '/listings' do
    redirect '/give_success'
end

