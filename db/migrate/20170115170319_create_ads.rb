class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.float :price

      t.timestamps
    end
  end
end
