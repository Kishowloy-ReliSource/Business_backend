class AddAdminIdToDealers < ActiveRecord::Migration[7.0]
  def change
    add_reference :dealers, :admin, null: true, foreign_key: true
  end
end
