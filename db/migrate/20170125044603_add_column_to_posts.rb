class AddColumnToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_reference :posts, :channel, foreign_key: true
  end
end
