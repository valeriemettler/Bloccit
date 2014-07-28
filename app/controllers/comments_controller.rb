class CommentsController < ApplicationController
  before_action :set_topic_and_post

  def create
    @comments = @post.comments
    @comment = current_user.comments.build( comment_params )
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Your comment was created"
    else
      flash[:error] = "Your comment was not created"
    end

    redirect_to [@topic, @post]

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_topic_and_post
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
  end

end
