class AttendeeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :attendee_id, :integer
  attribute :status, :string

  # Direct associations

  belongs_to :event

  belongs_to :attendee,
             resource: UserResource

  # Indirect associations
end
