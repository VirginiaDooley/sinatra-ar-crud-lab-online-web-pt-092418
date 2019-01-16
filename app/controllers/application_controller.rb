
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
    # binding.pry

    @article = Article.create(params)
    # @article1 = Article.create(:title => article_title, :content => article_content)

    redirect to "/articles/#{@article.id}"
  end

  #Read (general)
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  #Read (specific)
  get 'articles/:id' do
    #creates an instance variable to pass on data to a view
    @article = Article.find(params[:id])
    erb :show
  end

  #Update
  get 'articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

end
