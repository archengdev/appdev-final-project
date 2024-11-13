# == Schema Information
#
# Table name: categorisations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  food_id     :integer
#
class Categorisation < ApplicationRecord
  belongs_to :food, required: true, class_name: "Food", foreign_key: "food_id"
  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id"
end
