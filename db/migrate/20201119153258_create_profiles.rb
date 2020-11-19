class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :phone_num, null: false
      t.integer :zipcode, null: false
      t.date :date_of_birth, null: false
      t.references :user
      t.timestamps
    end
  end
end
