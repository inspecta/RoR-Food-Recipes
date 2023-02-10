class RecipeFood < ApplicationRecord
  # Associations
  belongs_to :recipe, foreign_key: :recipe_id

  # Validations
  validates :quantity, presence: true
end
