
get '/show' do
    erb :show
end


get '/listings' do
    @search_term = params[:item]
    @location = params[:location]
    if params[:category] 
        @listings = Category.find_by(title: params[:category]).listings
    elsif params[:item] && params[:item] != "" 
        @listings = Listing.where(title: params[:item]) 
         
    else
        @listings = Listing.all
    end 
    erb :listings
end


get '/listings/:id' do
    @listing = Listing.find(params[:id])
    @category = Category.find(@listing.category_id)
    @comments = Comment.where(listing_id: params[:id])
    @answers = Answer.where(listing_id: params[:id])
    erb :item
end
 

get '/listings/:id/taken' do
    erb :taken
end


get '/give_success' do
    listing = Listing.last
    @listing_id = listing.id
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
    @street_address = params[:street_address]
    @post_code = params[:post_code]
    @image = params[:image_url]
    erb :give_preview
end


post '/listings' do
    listing = Listing.new
    listing.title = params[:title]
    listing.category_id = Category.find_by(title: params[:category].capitalize).id
    listing.description = params[:description]
    listing.user_id = session[:user_id]
    listing.street_address = params[:street_address]
    listing.postcode = params[:postcode]
    listing.image_url = params[:image_url]
    listing.date_created = Time.now
    listing.status = 'active'
    listing.save
    redirect '/give_success'
end




