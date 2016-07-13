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

class TicketSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner, :description, :curstatus
end
