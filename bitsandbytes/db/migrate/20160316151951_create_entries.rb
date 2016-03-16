class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :url
      t.text :note
      t.integer :upvote
      t.integer :downvote
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
