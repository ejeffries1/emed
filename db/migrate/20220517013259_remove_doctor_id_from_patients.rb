class RemoveDoctorIdFromPatients < ActiveRecord::Migration[7.0]
  def change
    remove_column :patients, :doctor_id, :integer
  end
end
