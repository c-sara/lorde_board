     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'bcrypt'
require 'pry' if development?

require_relative 'lib/helpers.rb'

require_relative 'models/post.rb'
require_relative 'models/user.rb'
require_relative 'models/comments.rb'

enable :sessions

get '/' do

  redirect '/login' if !logged_in?

  posts = find_all_posts()
  
  erb :index, locals: { posts: posts }

end

get '/login' do
  
  redirect '/' if logged_in?

  erb :login

end

get '/sign_up' do
  
  redirect '/' if logged_in? 

  erb :sign_up

end

post '/sign_up' do
  
  redirect '/' if logged_in?

  user = create_user(params["username"], params["avatar_url"], params["email"], encrypt_password("#{params['password_digest']}"))
  

  session[:user_id] = user['id']

  redirect '/'

end

get '/about' do

  erb :about

end

get '/links' do
  
  erb :links

end

get '/posts/new' do

  redirect '/login' if !logged_in?
  
  erb :new_post

end

post '/posts' do

  redirect '/login' if !logged_in?

  create_post(params["title"], params["post_text"], params["image_url"], params["video_url"], Time.now, current_user["id"])

  redirect '/'

end

get '/posts/:id' do
  
  redirect '/login' if !logged_in?
  
  post = find_post_by_id(params["id"])
  
  comments = find_all_comments()
  
  erb :post_details, locals: { post: post, comments: comments }
  
end

get '/posts/:id/edit' do
  
  redirect '/login' if !logged_in?
  
  post = find_post_by_id(params["id"])
  
  erb :edit_post, locals: { post: post }

end

put '/posts/:id' do
  
  redirect '/login' if !logged_in?
  
  update_post(params[:id], params[:title], params[:post_text], params[:image_url], params[:video_url])
  
  redirect "/posts/#{params["id"]}"
  
end

delete '/posts/:id' do
  
  redirect '/login' if !logged_in?
  
  delete_post( params[:id] )
  
  redirect '/'
  
end

post '/comments/:id' do

  redirect '/login' if !logged_in?

  create_comment(current_user["id"], params["id"], params["comment"])

  redirect "/posts/#{params["id"]}"

end

get '/comments/:id/edit' do
  
  redirect '/login' if !logged_in?
  
  comment = find_comment_by_id(params["id"])
  
  erb :edit_comment, locals: { comment: comment }

end

post '/session' do
  user = find_user_by_email(params[:email])
  
  p user
  
  p params[:password_digest]
  
  p BCrypt::Password.new(user["password_digest"])

  if user && BCrypt::Password.new(user["password_digest"]) == params[:password_digest]

    session[:user_id] = user["id"] 
    # maybe change above
    redirect '/'

  else

    erb :login

  end

end

delete '/session' do
  session[:user_id] = nil

  redirect '/login'
  
end






