class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :showId
      t.string :content
      t.date :time

      t.timestamps
    end
  end
end
