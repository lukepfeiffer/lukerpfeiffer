class PostsController < ApplicationController

  expose :post
  expose :active_posts do
    Post.active.paginate(page: params[:page], per_page: 1).order('created_at DESC')
  end
  expose :archived_posts do
    Post.archived.order('created_at DESC')
  end

  def new
    if current_user.nil?
      redirect_to :root
    end
  end

  def edit
    if current_user.nil?
      redirect_to :root
    end
  end

  def archived
    if current_user.nil?
      redirect_to :root
    end
  end

  def update
    if current_user.nil?
      redirect_to :root
    else
      if post.update(post_params)
        redirect_to posts_path
      else
        redirect_to edit_post_path(post.id)
      end
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

  def unarchive
    if current_user.present?
      post = Post.find(params[:post_id])
      post.update(archive_date: nil)
      redirect_to archived_path
    else
      redirect_to :root
    end
  end

  def archive
    if current_user.present?
      post = Post.find(params[:post_id])
      post.update(archive_date: Date.today)
      redirect_to posts_path
    else
      redirect_to :root
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
