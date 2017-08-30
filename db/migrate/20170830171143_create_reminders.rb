class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.string    :text, null: false
      t.integer   :author_id, null: false
      t.datetime  :send_at, null: false

      t.timestamps
    end
  end
end
