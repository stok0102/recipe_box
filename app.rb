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
  recipe = Recipe.create({name: name, instruction: instruction, ingredient: ingredient})
  redirect '/recipes'
end
