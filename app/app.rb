ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require_relative 'models/link'


class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    p @links
    erb :links
  end

  post '/links' do
    link  = Link.new(url: params[:url],
                  title: params[:title])
    tag   = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :link_new
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'tags/index'
  end

  run! if app_file == $0

end
