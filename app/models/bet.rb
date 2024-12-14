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
  VALID_STATUSES = ["pending", "won", "lost"]
  belongs_to(:sportsbook)
  belongs_to(:event)
  has_one(:sport, through: :event)  
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }

  def potential_payout
    if odds > 0
      stake * odds / 100.0
    else
      stake * 100.0 / odds.abs
    end
  end

  def payout
    if status == "won"
      potential_payout
    elsif status == "lost"
      -stake
    else
      0
    end
  end

  def implied_odds
    if odds > 0
      100.0 / (odds + 100)
    else
      odds.abs / (100.0 + odds.abs)
    end
  end

  def self.total_balance(query)
    query.to_a.sum(&:payout)
  end

  def self.total_potential(query)
    query.to_a.sum(&:potential_payout)
  end

  def self.total_stake(query)
    query.sum(:stake)
  end

  def self.count_by_status(query, status)
    query.where(status: status).count
  end

  def self.total_yield(query)
    if total_stake(query) == 0
      0
    else
      total_balance(query) * 100 / total_stake(query)
    end
  end

end
