# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  lastname               :string           not null
#  docid                  :string           not null
#  username               :string           not null
#  pin                    :integer          not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  role                   :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  enum role: { admin: 0, chef: 1, waiter: 2, client: 3 }
  after_initialize :set_default_role, :if => :new_record? 

  def set_default_role 
    self.role ||= :client 
  end
  validates :username, :uniqueness => {:message => "Another username is the same."}
  validates :username, :presence => {:message => "The username is required."}
  validates :username, length: {minimum: 2, maximum: 20, :message => "min 2, max 20 characters"}
  validates :name, :presence => {:message => "The name is required."}
  validates :name, length: {minimum: 2, maximum: 20, :message => "min 2, max 20 characters"}
  validates :lastname, :presence => {:message => "The lastname is required."}
  validates :lastname, length: {minimum: 2, maximum: 20, :message => "min 2, max 20 characters"}
  validates :docid, :presence => {:message => "The docid is required."}
  validates :docid, length: {minimum: 8, maximum: 15, :message => "min 8, max 15 characters"}
  validates :pin, :presence => {:message => "The pin is required."}
  validates :pin, :uniqueness => {:message => "Another pin is the same."}
  validates :pin, length: {minimum: 1, maximum: 4, :message => "4 numbers"}
  #validates :password, length: {minimum: 6, maximum: 15, :message => "min 6, max 15 characters"}
  #validates :password_confirmation, length: {minimum: 6, maximum: 15, :message => "min 6, max 15 characters"}
  #validates :password_confirmation, :presence => {:message => "The confirmation password is required"}

  # Validamos en una expresion regular
  VALID_NAME_REGEX = /\A[a-zA-FñÑáéíóú ]+\z/i
  validates :name, format: { :with => VALID_NAME_REGEX , message: "Only letters are allowed" }

  VALID_LASTNAME_REGEX = /\A[a-zA-FñÑáéíóú ]+\z/i
  validates :lastname, format: { :with => VALID_LASTNAME_REGEX , message: "Only letters are allowed" }

  VALID_NUMBER_REGEX = /\A[0-9]+\z/i
  validates :docid, format: { :with => VALID_NUMBER_REGEX , message: "Only numbers" }
  validates :pin, format: { :with => VALID_NUMBER_REGEX , message: "Only numbers" }


  VALID_USERNAME_REGEX = /\A[a-zA-F0-9áéíóúñÑ_\-]+\z/i
  validates :username, format: { :with => VALID_USERNAME_REGEX , message: "Only letters, numbers, hyphens and underscore" }


  #VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9_.,+*&%ñÑáéíóú´\-]+\z/i
  #validates :password, format: { :with => VALID_PASSWORD_REGEX , message: "Invalid password" }

  #VALID_PASSWORDC_REGEX = /\A[a-zA-Z0-9_.,+*&%ñÑáéíóú´\-]+\z/i
  #validates :password_confirmation, format: { :with => VALID_PASSWORDC_REGEX , message: "Invalid password confirmation" }

end
