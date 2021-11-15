class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string

  # Direct associations

  has_many   :attendance_statuses,
             resource: AttendeeResource,
             foreign_key: :attendee_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :events,
             foreign_key: :host_id

  # Indirect associations
end
