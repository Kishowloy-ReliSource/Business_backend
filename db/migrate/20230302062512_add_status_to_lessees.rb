class AddStatusToLessees < ActiveRecord::Migration[7.0]
  def change
    add_column :lessees, :approved, :integer
  end
end
