# frozen_string_literal: true

class DeviseCreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :display_name, null: false, limit: 80
      t.string :website, limit: 100
      t.string :address, limit: 250

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :accounts, :email,                unique: true
    add_index :accounts, :reset_password_token, unique: true
  end
end
