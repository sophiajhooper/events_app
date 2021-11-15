class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :host_id, :integer
  attribute :start, :datetime
  attribute :end, :string
  attribute :address, :string
  attribute :details, :string
  attribute :photo, :string

  # Direct associations

  has_many   :attendees

  has_many   :comments

  belongs_to :host,
             resource: UserResource

  # Indirect associations
end
