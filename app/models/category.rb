# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many  :categorisations, class_name: "Categorisation", foreign_key: "category_id", dependent: :destroy
  has_many :foods, through: :categorisations, source: :food
end
