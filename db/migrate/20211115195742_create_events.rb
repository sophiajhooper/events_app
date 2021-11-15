class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :host_id
      t.datetime :start
      t.string :end
      t.string :address
      t.text :details
      t.string :photo

      t.timestamps
    end
  end
end
