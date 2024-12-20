# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sport < ApplicationRecord
  has_many(:events)
  has_many(:bets, through: :events)
end
