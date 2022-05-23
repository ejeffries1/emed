class RemoveDoctorFromPrescriptions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :prescriptions, :doctor, null: false, foreign_key: true
  end
end
