class PostImageCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    post_image_comment = current_user.post_image_comments.new(post_image_comment_params)
    post_image_comment.post_image_id = post_image.id
    comment_image = post_image_comment.post_image
    if post_image_comment.save
      comment_image.create_notification_comment!(current_user, post_image_comment.id)
      redirect_to post_image_path(post_image)
    end
  end

  def destroy
    PostImageComment.find_by(id: params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_image_comment_params
    params.require(:post_image_comment).permit(:post_image_comment)
  end
end
