class CreateUsers < ActiveRecord::Migration
  def change
    create_table  :users do |t|
      t.text :email
      t.text :name
      t.text :username
      t.text :photo_url
      t.text :last_updated
      t.integer :stale_time
      t.timestamps
    end
  end
end
