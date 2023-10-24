class ConsultationRequest < ApplicationRecord
  validates :patient_id, :text, presence: true
  belongs_to :patient
  has_one :recommendation
end