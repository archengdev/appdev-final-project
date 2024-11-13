class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :image_url
      t.string :name

      t.timestamps
    end
  end
end
