class TaskPriority < ApplicationRecord
    has_many :tasks, class_name: "Task", foreign_key: "priority_id"
    
    validates :name, presence: true, length: { minimum: 3, maximum: 20 }
    validates :level, presence: true
end
