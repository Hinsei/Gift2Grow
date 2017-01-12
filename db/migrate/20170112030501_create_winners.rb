class CreateWinners < ActiveRecord::Migration[5.0]
  def change
    create_table :winners do |t|
    	t.belongs_to :giveaway, index: true
    	t.integer :winners
    	t.integer :backup_winners, array: true, default: []
    	t.timestamps null:false
    end
  end
end
