class CreateRecipesTagsJoin < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredient
      t.string :instruction
      t.integer :rating
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :recipes_tags do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :tag, index: true
    end
  end
end
