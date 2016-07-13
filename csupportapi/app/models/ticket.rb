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

  after_initialize :set_status, unless: :persisted?

  OPEN = 0
  PROGRESS = 1
  CLOSED = 2
  STATUS_HASH = {"Open":0, "InProgress":1, "Closed":2}
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :status, presence: true, inclusion: { in: [OPEN, PROGRESS, CLOSED],
    message: "Status is not valid." }
  validates :user_id, presence: true
  belongs_to :user

  def set_status
    self.status = OPEN if self.status.nil?
  end

  def owner
    user.name.to_s if user
  end

  def curstatus
    ((status == 0) ? "Open" : (status==1) ? "InProgress" : "Closed").to_s
  end
end
