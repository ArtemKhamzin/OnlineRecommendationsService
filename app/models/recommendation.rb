class Recommendation < ApplicationRecord
  validates :consultation_request_id, :text, presence: true
  belongs_to :consultation_request
end
