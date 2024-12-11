# == Schema Information
#
# Table name: bets
#
#  id            :bigint           not null, primary key
#  name          :string
#  odds          :integer
#  stake         :integer
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_id      :integer
#  sportsbook_id :integer
#
class Bet < ApplicationRecord
  VALID_STATUSES = ["placed", "not_placed", "won", "lost"]
  belongs_to(:sportsbook)
  belongs_to(:event)
  has_one(:sport, through: :event)  
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
end
