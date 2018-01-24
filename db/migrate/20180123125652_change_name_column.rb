class ChangeNameColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :name
  end
end
