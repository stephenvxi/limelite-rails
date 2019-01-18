class User < ApplicationRecord
  has_many :tasks
  has_many :assigned_tasks, class_name: "Task", foreign_key: "assignee_id"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }

  has_secure_password
end
