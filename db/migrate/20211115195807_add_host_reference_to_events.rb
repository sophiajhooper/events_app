class AddHostReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :users, column: :host_id
    add_index :events, :host_id
    change_column_null :events, :host_id, false
  end
end
