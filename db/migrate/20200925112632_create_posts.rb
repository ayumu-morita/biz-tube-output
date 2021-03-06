class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :image, null: false
      t.text :text, null: false
      t.text :question1
      t.text :question2
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
