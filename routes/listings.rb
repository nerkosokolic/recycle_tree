get '/show' do
    erb :show
end

get '/listing' do
    erb :listing
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
