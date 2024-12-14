class RemoveUserIdFromBets < ActiveRecord::Migration[7.1]
  def change
    remove_column :bets, :user_id, :integer
  end
end
