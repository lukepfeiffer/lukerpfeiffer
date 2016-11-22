class PostsController < ApplicationController
  expose :post
  expose :posts do
    Post.all
  end

  def new
    if current_user.nil?
      redirect_to :root
    end
  end

  def create
    if current_user.nil?
      redirect_to :root
    else
      post = Post.new(post_params)
      if post.save
        redirect_to posts_path
      else
        redirect_to new_post_path
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :image_url
    )
  end
end
