class Like < ApplicationRecord
    #어떤 하나의 Like를 찾아오면
    #어떤 사용자가 어떤 글을 좋아했는지 알 수 있다.
    belongs_to :user
    belongs_to :post
end
