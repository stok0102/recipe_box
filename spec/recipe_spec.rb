require "spec_helper"

describe Recipe do
  describe 'tag' do
    it "returns the tags associated with the recipe" do
      recipe = Recipe.create({:name => 'quiche'})
      breakfast = Tag.create({:name => 'breakfast'})
      french = Tag.create({:name => 'French'})
      recipe.update({:tag_ids => [breakfast.id, french.id]})
      expect(recipe.tags).to(eq([breakfast, french]))
    end
  end

  describe 'remove tag' do
    it "removes a tag from a recipe" do
      breakfast = Tag.create({:name => 'breakfast'})
      french = Tag.create({:name => 'French'})
      recipe = Recipe.create({:name => 'quiche', :tag_ids => [breakfast.id, french.id]})
      expect(recipe.tags).to(eq([breakfast, french]))
      recipe.tags.destroy(breakfast)
      expect(recipe.tags).to(eq([french]))
    end
  end
end
