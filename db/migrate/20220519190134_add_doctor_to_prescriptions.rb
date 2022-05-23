class AddDoctorToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :prescriptions, :doctor, null: false, foreign_key: true
  end
end
