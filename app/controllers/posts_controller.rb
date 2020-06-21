class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership, only: [:edit, :update, :destroy]
  respond_to :html, :json
  
  def index
    
    # views/posts/index.html.erb 에서 볼 수 있음
    # @posts변수에 모든 포스트를 created_at 기준 역순으로 정렬한걸 할당
    @posts = Post.all.order('created_at desc')
    # @posts_count 변수에 현재 로그인한 유저의 포스트 수를 할당
    @posts_count = current_user.posts.length
    respond_with(@posts)
  end
  
  def new
  end
  
  def create
    #new_post라는 임시변수를 만들고
    #Post 모델에서 새로운 객체를 생성해서
    #user_id: 는 현재 로그인한 사람의 id를 넣고
    #내용은 파리미터로 온 content를 넣어서 저장해주겠다.
    new_post = Post.new(user_id: current_user.id, content: params[:content])
    if new_post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end
  
  def edit
  end
  
  def update
    @post.content = params[:content]
    
    if @post.save
      redirect_to root_path
    else
      render :edit
    end
      
  end
  
  def destroy
    @post.destroy
    redirect_to root_path
  end
  
  private 
  
  def check_ownership
    #edit.html.erb에서 @post 사용할 수 있게 함
    #데이터베이스에서 처리할 글을 찾으려면 params[:id] 가 필요
    #<input type="hidden" name="id" value="<%= @post.id %>" 를 edit.html.erb 에 추가
    @post = Post.find_by(id: params[:id])
    #수정권한이 없으면 돌려보냄
    redirect_to root_path if @post.user_id != current_user.id
  end
  
end
