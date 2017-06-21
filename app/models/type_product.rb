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
    validates :name, :presence => {:message => "The name is required."}
    validates :name, length: {minimum: 2, maximum: 20, :message => "min 2, max 20 characters"}
    # Validamos en una expresion regular
    VALID_NAME_REGEX = /\A[a-zA-F0-9áéíóúñÑ_ \-]+\z/i
    validates :name, format: { :with => VALID_NAME_REGEX , message: "Only letters are allowed" }

end
