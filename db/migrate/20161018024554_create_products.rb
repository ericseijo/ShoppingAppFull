class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :estimated_cost, precision: 8, scale: 2
      t.references :user, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
