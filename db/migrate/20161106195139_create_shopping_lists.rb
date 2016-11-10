class CreateShoppingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.references :user, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
