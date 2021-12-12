require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/bookmarks'

class Bookmark < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  # routes:
  get '/' do
    erb(:index)
  end

  get '/view_bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:view_bookmarks)
  end

  post '/new_bookmark' do
    Bookmarks.add(params[:url], params[:title])
    redirect '/'
  end

  post '/delete_bookmark' do
    Bookmarks.delete(params[:to_delete])
    redirect '/'
  end

  post '/edit_bookmark' do
    Bookmarks.edit(params[:to_edit], params[:new_url], params[:new_title])
    redirect '/'
  end

  # get '/play' do
  #   @player_name = session[:player_name]  
  #   erb(:play)
  # end

  # post '/selection' do
  #   session[:player_choice] = params[:player_choice] 
  #   redirect '/results'
  # end

  # get '/results' do
  #   @player_name = session[:player_name] 
  #   @player_choice = session[:player_choice]
  #   @game = Game.new(@player_name, @player_choice)
  #   @computer_choice = @game.computer_choice
  #   erb(:results)
  # end 

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end