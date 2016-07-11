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

class Ticket < ApplicationRecord
  OPEN = 0
  PROGRESS = 1
  CLOSED = 2
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :status, presence: true, inclusion: { in: [OPEN, PROGRESS, CLOSED],
    message: "Status is not valid." }
  validates :user_id, presence: true
  belongs_to :user
end
