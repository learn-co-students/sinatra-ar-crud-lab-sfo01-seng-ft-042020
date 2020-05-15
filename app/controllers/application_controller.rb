
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  # CREATE
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    
    redirect "/articles/#{@article.id.to_s}"
  end
  
  # READ
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end
  
  # UPDATE
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])

    redirect "/articles/#{@article.id.to_s}"
  end

  # DELETE
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy

    erb :index
  end

end
