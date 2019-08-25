post '/questions' do
    @question = Comment.new
    @question.body = params[:body]
    @question.listing_id = params[:listing_id]
    @question.user_id = session[:user_id]
    @question.comment_type = "question"
    @question.question_replied = "no"
    @question.date_created = Time.now

    user = User.find(session[:user_id])
    @username = user.username
    listing = Listing.find(@question.listing_id)
    @listing_title = listing.title
    listing_owner = User.find(listing.user_id)
    @listing_owner_email = listing_owner.email

    # binding.pry
    @question.save
    send_question_email
    redirect "/listings/#{params[:listing_id]}"
end