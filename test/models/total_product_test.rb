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

require 'test_helper'

class TotalProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
