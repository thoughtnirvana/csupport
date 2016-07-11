# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  user_id     :integer
#  description :string(255)
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :ticket do
    name "MyString"
    user_id 1
    description "MyString"
    status 1
  end
end
