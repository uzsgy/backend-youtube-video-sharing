class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :user, foreign_key: true, null: false
      t.string :code, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :thumbnails, null: false

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
