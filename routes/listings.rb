get '/show' do
    erb :show
end

get '/listings' do
    @search_term = params[:item]
    @location = params[:location]
    @listings = Listing.all
    erb :listings
end

get '/listings/:id' do
    @listing = Listing.find(params[:id])
    @category = Category.find(@listing.category_id)
    @comments = Comment.where(listing_id: params[:id])
    erb :item
end

get '/listings/:id/taken' do
    erb :taken
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
