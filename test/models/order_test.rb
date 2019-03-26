# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  orderdate  :datetime         not null
#  pinwaiter  :integer          not null
#  pinchef    :integer
#  attenddate :datetime
#  payvalue   :integer          not null
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  table_id   :integer
#  address    :string
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
