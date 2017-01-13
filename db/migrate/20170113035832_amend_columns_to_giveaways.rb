class AmendColumnsToGiveaways < ActiveRecord::Migration[5.0]
  def change
    change_column :giveaways, :start_date, :datetime
    remove_column :giveaways, :start_time, :time
    change_column :giveaways, :end_date, :datetime
    remove_column :giveaways, :end_time, :time
  end
end
