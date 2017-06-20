# == Schema Information
#
# Table name: type_products
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypeProduct < ActiveRecord::Base
end
