ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    p @links
    erb :links
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb :link_new
  end

  run! if app_file == $0

end
