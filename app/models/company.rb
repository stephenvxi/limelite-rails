class Company < ApplicationRecord
    has_many :users
    belongs_to :creator, class_name: "User", foreign_key: "created_by"
    
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true
end
