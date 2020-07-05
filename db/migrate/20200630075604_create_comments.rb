class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      # == t.integer :user_id
      t.belongs_to :post
      t.text :content
      
      t.timestamps
    end
  end
end