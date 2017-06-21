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

  validates :name, :presence => {:message => "The name is required."}
  validates :name, length: {minimum: 2, maximum: 20, :message => "min 2, max 20 characters"}
  validates :description, length: {maximum: 100, :message => "max 100 characters"}
  validates :price, :presence => {:message => "The price is required."}
  validates :type_product_id, :presence => {:message => "The type product is required."}

  # Validamos en una expresion regular
  VALID_NAME_REGEX = /\A[a-zA-F0-9áéíóúñÑ_ \-]+\z/i
  validates :name, format: { :with => VALID_NAME_REGEX , message: "Only letters are allowed" }
  validates :description, format: { :with => VALID_NAME_REGEX , message: "Only letters are allowed" }

  VALID_NUMBER_REGEX = /\A[0-9]+\z/i
  validates :price, format: { :with => VALID_NUMBER_REGEX , message: "Only numbers" }


end
