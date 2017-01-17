class ChangeWinnersWinnersDatatype < ActiveRecord::Migration[5.0]
  def change
  	remove_column :winners, :winners, :integer
  	add_column :winners, :main_winners, :integer, array: true, default: []
  end
end
