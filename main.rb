require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'database_config'


require_relative 'models/business'
require_relative 'models/category'
require_relative 'models/comment'
require_relative 'models/listing'
require_relative 'models/message'
require_relative 'models/user'


enable :sessions

helpers do

  def logged_in?  
    if current_user
      return true  
    else
      return false
  end
end

  def current_user
    User.find_by(id: session[:user_id]) 
  end

end


also_reload File.expand_path(__dir__, "views/*")
also_reload File.expand_path(__dir__, "models/*")




require_relative 'routes/account'
require_relative 'routes/comment'
require_relative 'routes/listing'
require_relative 'routes/message'
require_relative 'routes/session'




after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end





