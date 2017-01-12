class ChangeReferals < ActiveRecord::Migration[5.0]
  def change
  	rename_table :referals, :referrals
  end
end
