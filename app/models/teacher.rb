
class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :skip_password_validation  # virtual attribute to skip password validation while saving

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teacher_time_slots, dependent: :destroy
  has_one :teacher_profile, dependent: :destroy
  has_many :user_time_slots, dependent: :destroy

  accepts_nested_attributes_for :teacher_profile

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
