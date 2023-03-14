class AddPhoneToDealer < ActiveRecord::Migration[7.0]
  def change
    add_column :dealers, :phone, :string
  end
end
