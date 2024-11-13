class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :food_id
      t.integer :user_id
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
