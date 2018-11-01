class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
     @recipe = Recipe.create(params)
    
    redirect "/recipes/#{@recipe.id}"
  end


  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


  # post '/recipes/:id' do
  # @recipe = Recipe.create(params[:recipe])
  # redirect '/recipes'
  # end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
  erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.update(params[:id], params[:recipe])
    redirect "/recipes/#{@recipe.id}"
    
  end

  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end


end