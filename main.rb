require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'database_config'
require 'bcrypt'

also_reload File.expand_path(__dir__, 'models/*') if development?
also_reload File.expand_path(__dir__, 'views/*') if development?
also_reload File.expand_path(__dir__, 'routes/*') if development?

require_relative 'models/answer'
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

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

require_relative 'routes/accounts'
require_relative 'routes/listings'
require_relative 'routes/maps'
require_relative 'routes/messages'
require_relative 'routes/questions'
require_relative 'routes/answers'
require_relative 'routes/sessions'
# require_relative 'email'
require_relative 'routes/email'