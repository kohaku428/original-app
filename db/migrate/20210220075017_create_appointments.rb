class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :hairdresser, foreign_key: true
      t.time :time, null: false
      t.date :day, null: false
      t.timestamps
    end
  end
end
