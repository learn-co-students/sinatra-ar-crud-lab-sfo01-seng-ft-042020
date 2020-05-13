
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect :"/articles/#{@article.id}"
  end

  get '/show' do
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)
    erb :edit
  end

  delete '/articles/:id' do
    Article.find(params[:id].to_i).destroy
    redirect :"/articles"
  end

  patch '/articles/:id' do
    Article.find(params[:id].to_i).update(params[:article])
    redirect :"articles/#{params[:id]}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end
end
