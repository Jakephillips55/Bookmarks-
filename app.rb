require 'sinatra/base'
require_relative './lib/bookmark'
require './database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/new' do
    # if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
    flash[:notice] = "INCORRECT URL" unless Bookmark.create(url: params[:url], title: params[:title])

    redirect '/bookmarks'
  end


  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
      Bookmark.update(id: params[:id], title: params[:title],
      url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
