module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    @visiter_comment = notification.post_image_comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href: user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visiter.name, href: user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href: post_image_path(notification.post_image_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
        @comment = PostImageComment.find_by(id: @visiter_comment)&.post_image_comment
        tag.a(@visiter.name, href: user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href: post_image_path(notification.post_image_comment_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end
end
