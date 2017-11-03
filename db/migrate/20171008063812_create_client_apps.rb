class CreateClientApps < ActiveRecord::Migration[5.0]
  def change
    create_table :client_apps do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.text :source
      t.boolean :published
      t.integer :sort_order
      t.timestamps
    end
  end
end
