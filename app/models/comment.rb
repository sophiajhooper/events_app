class Comment < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :commenter,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end
end
