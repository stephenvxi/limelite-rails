class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: "User"
  belongs_to :status, class_name: "TaskStatus"
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true
  validates :user_id, presence: true

end
