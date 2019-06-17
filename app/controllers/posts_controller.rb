class PostsController < ApplicationController
  before_action :check_signed_in, only: [:new, :create]

  def new
  end

  def create
    post = Post.new(params.require(:post).permit(:text))
    post.author_id = current_user.id
    if post.save
      redirect_to posts_path
    else
      flash.now[:danger] = "Error"
      render 'new'
    end
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
                    .order('created_at DESC')
  end
end
