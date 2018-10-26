class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :publisher_id
      t.string :subscriber_id

      t.timestamps
    end
  end
end
