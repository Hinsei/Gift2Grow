class CreateReferals < ActiveRecord::Migration[5.0]
  def change
    create_table :referals do |t|
    	t.belongs_to :participant, index: true
    	t.timestamps null: false
    end
  end
end
