# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  description         :text
#  price               :integer          not null
#  type_product_id     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Product < ActiveRecord::Base
  belongs_to :type_product
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/product.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
