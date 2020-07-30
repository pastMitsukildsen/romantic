class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id, null: false
      t.integer :user_id
      t.boolean :genre, default: true, null: false

      t.timestamps
    end
  end
end
