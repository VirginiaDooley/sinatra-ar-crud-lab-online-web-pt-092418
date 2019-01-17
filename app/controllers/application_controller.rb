
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #Create
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  #Read (general)
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #Read (specific)
  get '/articles/:id' do
    #creates an instance variable to pass on data to a view
    @article = Article.find(params[:id])

    erb :show
  end

  #Update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
   @article = Article.find(params[:id])
   @article.title = params[:title]
   @article.content = params[:content]
   #saves edits
   @article.save

   redirect to "/articles/#{@article.id}"
 end

 # Delete

 delete '/articles/:id' do
   @article = Article.find(params[:id])
   @article.delete

   erb :index
 end

end
