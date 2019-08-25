post '/answers' do
    answer = Answer.new
    answer.body = params[:body]
    answer.listing_id = params[:listing_id]
    answer.user_id = session[:user_id]
    answer.comment_id = params[:comment_id]
    answer.comment_type = "answer"
    answer.date_created = Time.now
    comment = Comment.find(params[:comment_id])
    comment.question_replied = "yes"

    listing = Listing.find(params[:listing_id])
    @listing_title = listing.title
    @listing_id = listing.id

    question_asker = User.find(comment.user_id)
    @question_asker_email = question_asker.email

    user = User.find(session[:user_id])
    @username = user.username

    # binding.pry
    answer.save
    comment.save
    # send_answer_email
    redirect "/listings/#{params[:listing_id]}"
end