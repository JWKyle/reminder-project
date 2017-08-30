class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.string    :text
      t.integer   :author_id
      t.datetime  :send_at

      t.timestamps
    end
  end
end
