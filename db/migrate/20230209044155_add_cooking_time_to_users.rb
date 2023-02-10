class AddCookingTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :cooking_time, :string
  end
end
