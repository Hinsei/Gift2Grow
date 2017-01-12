class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
    	t.string :name
    	t.string :email
    	t.string :website
    	t.text :social_media_link, array: true, default: []
    	t.string :address
    	t.string :contact
    	t.string :password_digest
    	t.integer :role
    	t.timestamps null: false
    end
  end
end
