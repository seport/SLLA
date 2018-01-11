class ChangeRoleColumnToAdmin < ActiveRecord::Migration[5.1]
  def change
    rename_column(:users, :role, :admin)
    change_column(:users, :admin, :boolean)
  end
end
