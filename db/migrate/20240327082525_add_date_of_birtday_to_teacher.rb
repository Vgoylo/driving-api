class AddDateOfBirtdayToTeacher < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :date_of_birthday, :datetime
    change_column_null :teachers, :date_of_birthday, false
  end
end
