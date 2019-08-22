post '/comments' do
    comments = Comment.new
    comments.body = params[:body]
    comments.listing_id = params[:listing_id]
    comments.user_id = session[:user_id]
    # binding.pry
    comments.save
    redirect "/listings/#{params[:listing_id]}"
end
  
