class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :title
      t.string :medication
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
