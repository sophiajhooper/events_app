class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :attendance_statuses,
             class_name: "Attendee",
             foreign_key: "attendee_id",
             dependent: :destroy

  has_many   :comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :events,
             foreign_key: "host_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
