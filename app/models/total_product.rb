# == Schema Information
#
# Table name: total_products
#
#  id            :integer          not null, primary key
#  ingredient_id :integer          not null
#  product_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TotalProduct < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :product
end
