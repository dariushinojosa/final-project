# == Schema Information
#
# Table name: sportsbooks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sportsbook < ApplicationRecord
end