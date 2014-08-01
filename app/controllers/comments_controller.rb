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

  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_topic_and_post
    @post = Post.find(params[:post_id])
    @topic = @post.topic    
  end

end
