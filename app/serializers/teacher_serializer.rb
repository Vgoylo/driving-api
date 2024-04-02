class TeacherSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :first_name,
    :last_name,
    :middle_name,
    :email,
    :date_of_birthday,
    :price,
    :unp

    def price
      object.teacher_profile.price
    end

    def unp
      object.teacher_profile.unp
    end
end
