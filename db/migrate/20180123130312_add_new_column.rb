class AddNewColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :firstname, :string, null: false, default: ""
    add_column :members, :lastname, :string, null: false, default: ""
    add_column :members, :mobile_no ,:bigint
  end
end
