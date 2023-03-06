class CreateLessees < ActiveRecord::Migration[7.0]
  def change
    create_table :lessees do |t|
      t.string :lesseename
      t.string :lesseeaddress
      t.string :lesseephone
      t.integer :lesseemonthlyincome
      t.date :lesseedob
      t.string :colesseename
      t.string :colesseeaddress
      t.string :colessephone
      t.integer :colesseemonthlyincome
      t.date :colesseedob
      t.integer :downpayment
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
