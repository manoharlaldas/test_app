class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :post_id
    	t.integer :user_id
    	t.text :body
    	t.references :post

      t.timestamps null: false
    end
    add_index :comments, :post_id
  end
end
