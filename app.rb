require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/recipes' do
  @recipes = Recipe.all
  @tags = Tag.all
  erb :recipes
end

post '/recipes' do
  name = params.fetch 'name'
  ingredient = params.fetch 'ingredient'
  instruction = params.fetch 'instruction'
  rating = params.fetch 'rating'
  tags_array = []
  params[:tag_box].each do |tag|
    tags_array.push(tag.to_i)
  end
  @recipe = Recipe.create({name: name, instruction: instruction, ingredient: ingredient, rating: rating})
  tags_array.each do |id|
    tag_hash = Tag.find(id)
    @recipe.tags.push(tag_hash)
  end
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

patch '/recipe/:id/rate' do
  rating = params.fetch('rating')
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.update({rating: rating})
  redirect("/recipe/".concat(@recipe.id().to_s()))
end

get '/tag/:id' do
  @recipes = Recipe.all
  @tag = Tag.find(params.fetch('id'))
  erb :tag
end

patch '/tag/:id' do
  name = params.fetch('new_tag')
  @tag = Tag.find(params.fetch('id'))
  @tag.update({name: name})
  redirect('/tag/'.concat(@tag.id().to_s()))
end

delete '/tag/:id' do
  @tag = Tag.find(params.fetch('id'))
  @tag.delete()
  redirect('/tags')
end

delete '/recipe/:id' do
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.delete()
  redirect('/recipes')
end

get '/rating/:id' do
  id = params.fetch('id').to_i
  if id > 0
    @recipes = Recipe.where(rating: id)
    erb :ratings
  else
    erb :error
  end
end

# post '/ratings' do
#   id = params.fetch('rating').to_i
#   @recipes = Recipe.where(rating: id)
#   redirect '/ratings'
# end
