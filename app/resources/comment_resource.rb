class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :commenter_id, :integer
  attribute :comment_text, :string

  # Direct associations

  belongs_to :event

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations
end
