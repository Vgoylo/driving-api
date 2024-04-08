class User < ApplicationRecord
  attr_accessor :skip_password_validation  # virtual attribute to skip password validation while saving

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_time_slots, dependent: :destroy

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
