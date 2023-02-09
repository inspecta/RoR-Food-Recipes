class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :public, presence: true
end
