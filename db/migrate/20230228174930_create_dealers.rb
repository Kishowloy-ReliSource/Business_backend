class CreateDealers < ActiveRecord::Migration[7.0]
  def change
    create_table :dealers do |t|
      t.string :email
      t.string :name
      t.integer :status
      t.date :dob
      t.string :pass

      t.timestamps
    end
  end
end
