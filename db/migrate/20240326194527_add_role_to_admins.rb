class AddRoleToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :role, :integer
  end
end
