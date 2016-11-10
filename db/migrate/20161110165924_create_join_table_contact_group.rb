class CreateJoinTableContactGroup < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Contacts, :Groups do |t|
      # t.index [:contact_id, :group_id]
      # t.index [:group_id, :contact_id]
    end
  end
end
