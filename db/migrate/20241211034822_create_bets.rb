class CreateBets < ActiveRecord::Migration[7.1]
  def change
    create_table :bets do |t|
      t.string :name
      t.integer :event_id
      t.integer :sportsbook
      t.integer :odds
      t.string :status

      t.timestamps
    end
  end
end
