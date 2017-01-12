class CreateGiveaways < ActiveRecord::Migration[5.0]
  def change
    create_table :giveaways do |t|
    	t.belongs_to :company, index: true
    	t.string :title
    	t.string :description
    	t.string :prize_name
    	t.string :prize_image
    	t.string :terms_and_condition
    	t.string :winner_message
    	t.string :consolation_message
    	t.string :link
    	t.integer :num_winner
    	t.integer :num_backup
    	t.timestamps null: false
    end
  end
end
