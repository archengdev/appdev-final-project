# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  description :text
#  rating      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  food_id     :integer
#  user_id     :integer
#
class Review < ApplicationRecord
  belongs_to :food, required: true, class_name: "Food", foreign_key: "food_id"
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
end
