class AddCategoryToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :category, :integer
  end
end
