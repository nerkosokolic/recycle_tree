post '/questions' do
    question = Comment.new
    question.body = params[:body]
    question.listing_id = params[:listing_id]
    question.user_id = session[:user_id]
    question.comment_type = "question"
    # binding.pry
    question.save
    redirect "/listings/#{params[:listing_id]}"
end
  
