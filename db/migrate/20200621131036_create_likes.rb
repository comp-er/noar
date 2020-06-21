class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      #like모델은 유저와 포스트 둘다 부모로 가진다.
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
