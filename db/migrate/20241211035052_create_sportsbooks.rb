class CreateSportsbooks < ActiveRecord::Migration[7.1]
  def change
    create_table :sportsbooks do |t|
      t.string :name

      t.timestamps
    end
  end
end
