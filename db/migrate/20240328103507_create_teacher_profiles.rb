class CreateTeacherProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :teacher_profiles do |t|
      t.belongs_to :teacher,      null:false,   foreign_key: true
      t.text :price,              null: false
      t.string :unp,              null:false

      t.timestamps
    end
  end
end
