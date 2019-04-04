class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true 
      t.string :password_digest, length: { minimum: 6, allow_nil: true }
      t.string :session_token, null: false
      t.timestamps
    end
    add_index :users, :session_token, unique: true 

  end
end
