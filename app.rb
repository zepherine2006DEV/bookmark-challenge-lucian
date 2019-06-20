require 'sinatra/base'
require 'bookmark'


class BookmarkManager < Sinatra::Base
  get '/bookmarks' do
    @array_of_bookmarks = Bookmark.all
    erb :view_bookmarks
  end

  get '/bookmarks/new' do
    erb :new_bookmark
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
