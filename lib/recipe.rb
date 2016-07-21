class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates(:name, :presence => true)
  validates(:ingredient, :presence => true)
  validates(:instruction, :presence => true)
  validates(:rating, :presence => true)
end
