class RemoveUpdatedAtFromConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    remove_column :consultation_requests, :updated_at, :datetime
  end
end
