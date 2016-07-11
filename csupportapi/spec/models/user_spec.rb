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
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "name" do
    it { should respond_to :name }
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

  describe "email" do
    it { should respond_to :email }
    it { should validate_presence_of :email }
    describe "uniqueness" do
      subject { User.new(name: "Steve", email: "steve@apple.com") }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
    it { should_not allow_value("steve@apple").for(:email) }
  end
end
