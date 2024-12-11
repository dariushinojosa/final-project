# == Schema Information
#
# Table name: bets
#
#  id         :bigint           not null, primary key
#  name       :string
#  odds       :integer
#  sportsbook :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#
class Bet < ApplicationRecord
end
