require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/recipes' do
  @recipes = Recipe.all
  erb :recipes
end

post '/recipes' do
  name = params.fetch 'name'
  ingredient = params.fetch 'ingredient'
  instruction = params.fetch 'instruction'
  @recipe = Recipe.create({name: name, instruction: instruction, ingredient: ingredient})
  redirect '/recipes'
end

get '/tags' do
  @tags = Tag.all
  erb :tags
end

post '/tags' do
  name = params.fetch 'name'
  tag = Tag.create({name: name})
  redirect '/tags'
end

get '/recipe/:id' do
  @tags = Tag.all
  @recipe = Recipe.find(params.fetch('id'))
  erb :recipe
end

patch '/recipe/:id' do
  tag = Tag.find(params.fetch('tag'))
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.tags.push(tag)
  redirect("/recipe/".concat(@recipe.id().to_s()))
end
