class CreateUsersFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :users_facilities do |t|
      t.integer :user_id
      t.integer :facility_id

      t.timestamps
    end
  end
end
