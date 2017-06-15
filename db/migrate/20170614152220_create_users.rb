class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.integer :status
      t.integer :gender
      t.string :password_digest
      t.string :remember_digest
      t.string :slug
      t.string :avatar

      t.timestamps
    end
    # add_index :users, :email
  end
end
