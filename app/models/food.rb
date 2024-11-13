# == Schema Information
#
# Table name: foods
#
#  id         :bigint           not null, primary key
#  image_url  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Food < ApplicationRecord
  has_many  :reviews, class_name: "Review", foreign_key: "food_id", dependent: :destroy
  has_many  :categorisations, class_name: "Categorisation", foreign_key: "food_id", dependent: :destroy
  has_many :user_ratings, through: :reviews, source: :user
  has_many :categories, through: :categorisations, source: :category
end
