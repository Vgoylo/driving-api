class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :first_name,             null: false, default: ""
      t.string :last_name,              null: false, default: ""
      t.string :middle_name,            null: false, default: ""
      t.string :email,                  null: false, default: ""
      t.string :phone_number,           null: false, default: ""

      t.timestamps
    end
  end
end
