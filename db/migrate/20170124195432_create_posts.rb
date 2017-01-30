class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :text
      t.references :user

      t.timestamps
    end
  end
end
