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

require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Ticket, :type => :model do
  describe "name" do
    it { should respond_to :name }
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:name).is_at_most(50) }
    describe "uniqueness" do
      subject { Ticket.new(name: "Ticket1", status: 0, user_id:1) }
      it { should validate_uniqueness_of(:name) }
    end
  end

  describe "status" do
    it { should respond_to :status }
    it { should validate_presence_of :status }
    it { should_not allow_value(10).for(:status) }
  end

  describe "user_id" do
    it { should respond_to :user_id }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
  end
end

