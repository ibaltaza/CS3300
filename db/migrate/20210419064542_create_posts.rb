class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.string :language
      t.text :code
      t.text :about
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
