class CreateCategorisations < ActiveRecord::Migration[7.1]
  def change
    create_table :categorisations do |t|
      t.integer :food_id
      t.integer :category_id

      t.timestamps
    end
  end
end
