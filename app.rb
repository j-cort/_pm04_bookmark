require 'sinatra/base'
require 'sinatra/reloader'
# require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
require './lib/bookmarks'

class Bookmark < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    # register Sinatra::Flash
  end

  # routes:
  get '/' do
    erb(:index)
  end

  get '/view_bookmarks' do
    @flash = session[:message]
    @bookmarks = Bookmarks.all
    erb(:view_bookmarks)
  end

  post '/new_bookmark' do
    Bookmarks.add(params[:url], params[:title]) ? session[:message] = nil : session[:message] = "Please enter a valid url!" 
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

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end