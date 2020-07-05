class Comment < ApplicationRecord
    belongs_to :user
    #comment.user 하면 작성자를 받아올 수 있게 됨
    belongs_to :post
end
