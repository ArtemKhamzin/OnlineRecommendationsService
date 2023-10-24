class Patient < ApplicationRecord
    validates :full_name, :date_of_birth, :phone_number, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    has_many :consultation_requests
end
