class AddSportIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :sport_id, :integer
  end
end
