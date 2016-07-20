require 'spec_helper'

describe Tag do
  describe 'recipe' do
    it 'returns the recipe associated with the tag' do
      quiche = Recipe.create({name: 'quiche'})
      croissant = Recipe.create({name: 'croissant'})
      breakfast = Tag.create({name: 'breakfast'})
      french = Tag.create({name: 'French'})
      french.update({recipe_ids: [quiche.id, croissant.id]})
      expect(french.recipes).to(eq([quiche, croissant]))
    end
  end

  describe 'remove recipe' do
    it "removes a recipe from a tag" do
      quiche = Recipe.create({name: 'quiche'})
      croissant = Recipe.create({name: 'croissant'})
      french = Tag.create({name: 'French', recipe_ids: [quiche.id, croissant.id]})
      expect(french.recipes).to(eq([quiche, croissant]))
      french.recipes.destroy(quiche)
      expect(french.recipes).to(eq([croissant]))
    end
  end

  describe 'new' do
    it "creates recipe through tag" do
      french = Tag.create({:name => 'French'})
      quiche = french.recipes.create(name: 'quiche')
      expect(quiche.tags).to(eq([french]))
    end
  end
end
