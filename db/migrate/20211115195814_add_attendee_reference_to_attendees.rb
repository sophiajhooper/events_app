class AddAttendeeReferenceToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendees, :users, column: :attendee_id
    add_index :attendees, :attendee_id
    change_column_null :attendees, :attendee_id, false
  end
end
