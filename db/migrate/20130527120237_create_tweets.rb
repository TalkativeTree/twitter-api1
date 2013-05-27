class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.text :time
      t.text :url
      t.references :user
      t.timestamps
    end
  end
end
