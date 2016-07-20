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
end
