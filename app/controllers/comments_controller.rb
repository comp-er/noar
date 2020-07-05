class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_ownership!, only: [:destroy]
    respond_to :html, :json
    
    def index
        #/posts/4/comments.json 로 전체글의 댓글 요청가능
        @comment = Comment.order('created_at desc')
        respond_with(@comment)
        #특정글의 댓글 요청 구현중
    end
    
    def create
        #new_comment라는 임시변수에,
        #migrate 파일에서 만들었던 text타입의 content 에
        #text area에 유저가 입력한 content를 받아온다
        #라우트규칙을 보면 post_id를 파라미터로 넘겨준다
        #지금 로그인된 유저의 아이디를 유저아이디로 넣는다.
        new_comment = Comment.new(content: params[:content],
                                  post_id: params[:post_id],
                                  user_id: current_user.id)
        new_comment.save
        redirect_to :back
    end
    
    def destroy
        @comment.destroy
        redirect_to :back
    end
    
    private
        def check_ownership!
            @comment = Comment.find_by(id: params[:id])
            redirect_to root_path if @comment.user.id != current_user.id
        end
end
