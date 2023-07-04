class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.references :user, index: true, foreign_key: true
      t.references :video, index: true, foreign_key: true
      t.integer :pref

      t.timestamps
    end
  end
end
