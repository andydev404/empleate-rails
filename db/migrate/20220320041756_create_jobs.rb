class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false, limit: 120
      t.references :account, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
