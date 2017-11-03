class CreateClientApps < ActiveRecord::Migration[5.0]
  def change
    create_table :client_apps do |t|
      t.integer :user_id
      t.string :name
      t.text :source
      t.timestamps
    end
  end
end
