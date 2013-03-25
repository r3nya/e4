class CommentsController < ApplicationController
  def new
    determine_comment_parent
    @comment = Comment.new
  end

  def create
    determine_comment_parent
    @comment = Comment.build_from( @object, current_user.id, params[:comment][:body] )
    @comment.obj_type = params[:comment][:obj_type]
    @comment.obj_id = params[:comment][:obj_id]
    if @comment.save
      redirect_to @comment.absolute_url
      if defined?(@threadable)
        @comment.move_to_child_of(@parent_comment)
      end
      track_it(@comment)
    else
      render 'new'
    end
  end

  def determine_comment_parent
    case params[:comment][:obj_type]
      when 'post'
        # We're replying to Post instance (forum post/news article)
        @object = Post.find(params[:comment][:obj_id])
      when 'comment'
        # We're replying to comment, need additional action.
        @threadable = true
        @parent_comment = Comment.find(params[:comment][:obj_id])
        @object = @parent_comment.commentable
      else
        redirect_to root_path
    end
  end
end
