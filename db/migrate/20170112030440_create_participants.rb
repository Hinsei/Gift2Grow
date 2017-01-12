class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
    	t.belongs_to :giveaway, index: true
    	t.string :name
    	t.string :email
    	t.integer :points
    	t.string :referral_identification
    	t.string :contact
    	t.timestamps null: false
    end
  end
end
