require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
require './lib/bookmarks'
require './lib/comment'
require './lib/tag'
require './lib/user'

class Bookmark < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  # routes:
  get '/' do
    @user = User.find(session[:user_id])
    erb(:index)
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users/new' do
    user = User.create(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else 
      flash[:notice] = 'A user with that email already exists!'
      redirect '/users/new'
    end
  end

  get '/users/login' do
    erb(:log_in)
  end

  post '/users/login' do 
    user_id = User.login(params[:email], params[:password])

    if user_id 
      session[:user_id] = user_id
      redirect '/'
    else 
      flash[:notice] = 'Please check your email or password!'
      redirect '/users/login'
    end

  end

  post '/users/signout' do
    session.clear
    redirect '/'
  end

  get '/view_bookmarks' do
    @user = User.find(session[:user_id])
    @flash = session[:message]
    @bookmarks = Bookmarks.all
    @comments = Comment.all_comments
    @tags = Tag.all_tags
    erb(:view_bookmarks)
  end

  post '/new_bookmark' do
    Bookmarks.add(params[:url], params[:title]) ? flash[:notice] = nil : flash[:notice] = "Please enter a valid url!" 
    redirect '/view_bookmarks'
  end

  post '/delete_bookmark' do
    Bookmarks.delete(params[:to_delete])
    redirect '/view_bookmarks'
  end

  post '/edit_bookmark' do
    Bookmarks.edit(params[:to_edit], params[:new_url], params[:new_title])
    redirect '/view_bookmarks'
  end

  post '/new_comment' do
    Comment.add_comment(params[:text], params[:bookmark_id])
    redirect '/view_bookmarks'
  end

  post '/delete_bookmark_commment' do
    Comment.delete_comment(params[:comment_id])
    redirect '/view_bookmarks'
  end

  post '/new_tag' do
    Tag.add_tag(params[:content], params[:bookmark_id]) #? session[:message_tag] = nil : session[:message_tag] = "Tag already added to bookmark!" 
    redirect '/view_bookmarks'
  end

  post '/delete_bookmark_tag' do
    Tag.delete_tag(params[:tag_id])
    redirect '/view_bookmarks'
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end