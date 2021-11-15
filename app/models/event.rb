class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :attendees,
             dependent: :nullify

  has_many   :comments,
             dependent: :destroy

  belongs_to :host,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
