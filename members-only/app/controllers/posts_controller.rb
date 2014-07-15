class PostsController < ApplicationController
  before_action :make_post, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      flash[:success] = "Successfully created Post"
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def index
    @posts = Post.all
  end


  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def make_post
      unless signed_in?
        flash[:notice] = "You must be signed in"
        redirect_to signin_path
      end
    end


end
