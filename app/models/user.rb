class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :liked
  
  # 1:N 관계인 likes를 이용해서 Post와 N:N 관계를 구현 
  # 특정 유저가 좋아요를 누른 posts를 얻을 수 있음. 
  # ex) user.likes_posts
  
  #유저입장에서 좋아하는 글을 가져오는데,
  #가져올 때 Likes를 토대로 찾게되고,
  #그 속에서 post만 묶어서 보여준다.(그 출처는 post다)
  has_many :liked_posts, through: :likes, source: :post
  
  #User 모델의 한 객체에 대해 특정 글에 대한 좋아요 유무를 확인
  def is_like?(post) 
    Like.find_by(user_id: self.id, post_id: post.id).present? 
  end
end
