class TaskStatus < ApplicationRecord
    has_many :tasks, class_name: "Task", foreign_key: "status_id"
    
    validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end
