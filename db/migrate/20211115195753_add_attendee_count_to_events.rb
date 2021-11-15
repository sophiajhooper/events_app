class AddAttendeeCountToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :attendees_count, :integer
  end
end
