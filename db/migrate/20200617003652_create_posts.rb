class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
  end
  #user_id를 색인해서 빠르게 찾아올 수 있게 한다.
  #add_index :posts, :user_id
  #이는 t.intager :user_id 를 t.belongs_to :user 로 바꿔서 대체할수 있다. 
end
