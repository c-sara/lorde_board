     
require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require 'pry'

require_relative 'lib/helpers.rb'

require_relative 'models/post.rb'
require_relative 'models/user.rb'

get '/' do

  posts = find_all_posts()
  
  erb :index, locals: { posts: posts }

end

get '/about' do

  erb :about

end




