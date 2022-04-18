class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :title, null: false

      t.index :title, unique: true

      t.timestamps
    end
  end
end
