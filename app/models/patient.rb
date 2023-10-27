class Patient < ApplicationRecord
    validates :full_name, :date_of_birth, :phone_number, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :email, uniqueness: true
    has_many :consultation_requests
end
