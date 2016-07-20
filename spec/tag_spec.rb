require 'spec_helper'

describe Tag do
  describe 'recipe' do
    it 'returns the recipe associated with the tag' do
      quiche = Recipe.create({:name => 'quiche'})
      croissant = Recipe.create({:name => 'croissant'})
      breakfast = Tag.create({:name => 'breakfast'})
      french = Tag.create({:name => 'French'})
      french.update({:recipe_ids => [quiche.id, croissant.id]})
      expect(french.recipes).to(eq([quiche, croissant]))
    end
  end


end
