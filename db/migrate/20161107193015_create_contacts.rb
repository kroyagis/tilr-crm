class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :profile_picture
      t.text :note
      t.integer :contact_id

      t.timestamps
    end
  end
end
