class AddDatesToGiveaways < ActiveRecord::Migration[5.0]
  def change
    add_column :giveaways, :start_date, :date
    add_column :giveaways, :start_time, :time
    add_column :giveaways, :end_date, :date
    add_column :giveaways, :end_time, :time
  end
end
