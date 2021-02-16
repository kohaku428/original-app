class CreateHairdressers < ActiveRecord::Migration[6.0]
  def change
    create_table :hairdressers do |t|
      t.string :name,  null: false
      t.text :profile, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
