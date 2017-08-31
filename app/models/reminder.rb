class Reminder < ApplicationRecord

  validates_presence_of :text, :author_id, :send_at

  belongs_to :author, class_name: :user

end
