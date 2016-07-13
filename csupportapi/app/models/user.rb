# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)      default("email"), not null
#  uid                    :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  image                  :string(255)
#  email                  :string(255)
#  tokens                 :text(65535)
#  created_at             :datetime
#  updated_at             :datetime
#  roles_mask             :integer
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  ROLES = %i[customer agent admin]
  ROLES_HASH = {"Customer":1, "Agent":2, "Admin":4}
  
  def roles=(roles)
   roles = [*roles].map { |r| r.to_sym }
   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def role
    (roles.include? :admin) ? "Admin" : (roles.include? :agent) ? "Agent" : "Customer"
  end

  def roles
   ROLES.reject do |r|
     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
   end
  end

  def has_role?(role)
   roles.include?(role)
  end

  has_many :tickets
end
