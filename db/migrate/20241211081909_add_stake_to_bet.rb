class AddStakeToBet < ActiveRecord::Migration[7.1]
  def change
    add_column :bets, :stake, :integer
  end
end
