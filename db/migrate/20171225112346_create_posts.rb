class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.json :image
      t.string :type
      t.datetime :start_event_at

      t.timestamps
    end
  end
end
