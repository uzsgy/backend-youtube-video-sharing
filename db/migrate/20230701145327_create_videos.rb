class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :user, foreign_key: true, null: false
      t.string :url
      t.string :embed_url
      t.string :title
      t.string :description

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
