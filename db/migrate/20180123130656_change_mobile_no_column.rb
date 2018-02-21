class ChangeMobileNoColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :mobile_no ,:bigint,null: false, default: 0
  end
end
