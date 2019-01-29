class User < ApplicationRecord
  has_many :tasks
  has_many :assigned_tasks, class_name: "Task", foreign_key: "assignee_id"
  has_many :created_users, class_name: "User", foreign_key: "created_by"
  belongs_to :company
  has_many :created_companies, class_name: "Company", foreign_key: "created_by"
  belongs_to :creator, class_name: "User", foreign_key: "created_by"
  has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
                           foreign_key: :resource_owner_id,
                           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
                           foreign_key: :resource_owner_id,
                           dependent: :delete_all # or :destroy if you need callbacks

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }

  has_secure_password
  
  def has_company?
    !!company
  end
end
