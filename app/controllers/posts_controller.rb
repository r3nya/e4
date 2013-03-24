class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => ['new', 'create']
  before_filter :preload_params


  def new
    if @forum.newsforum
      admin_access
    end
    @post = Post.new()
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.forum = @forum
    if @forum.newsforum
      @post.article = true
    end
    if @post.save
      redirect_to forum_post_path(@forum, @post)
    else
      flash.now[:error] = t 'common.messages.errors.form_invalid'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @commenteries = @post.comment_threads
  end

  def preload_params
    @forum = Forum.find_by_url(params[:forum_id])
    @comment = Comment.new()
  end
end
