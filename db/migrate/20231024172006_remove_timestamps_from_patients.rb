class RemoveTimestampsFromPatients < ActiveRecord::Migration[7.1]
  def change
    remove_column :patients, :created_at, :datetime
    remove_column :patients, :updated_at, :datetime
  end
end
