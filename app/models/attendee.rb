class Attendee < ApplicationRecord
  # Direct associations

  belongs_to :event,
             counter_cache: true

  belongs_to :attendee,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end
end
