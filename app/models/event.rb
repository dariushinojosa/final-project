# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :integer
#
class Event < ApplicationRecord
  belongs_to(:sport)
  has_many(:bets)
end
