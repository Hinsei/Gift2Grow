class AddColumnGiveawaysStatus < ActiveRecord::Migration[5.0]
  def change
  	add_column :giveaways, :status, :integer
  end
end
