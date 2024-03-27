class AddRoleToTeacher < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :role, :integer, default: 0
  end
end
