class UpdateBetSchema < ActiveRecord::Migration[7.1]
  def change
    rename_column :bets, :sportsbook, :sportsbook_id
  end
end
