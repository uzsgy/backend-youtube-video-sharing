class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, index: true, unique: true
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :role

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
