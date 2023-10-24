class Patient < ApplicationRecord
    validates :full_name, :date_of_birth, :phone_number, :email, presence: true
    validates :email, uniqueness: true
    has_many :consultation_requests
end
