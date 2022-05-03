class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|

      t.string :user_id
      t.string :image_id
      t.text   :hashbody
      t.text   :body

      t.timestamps
    end
  end
end
