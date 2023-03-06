class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.string :year
      t.string :mileage

      t.timestamps
    end
  end
end
