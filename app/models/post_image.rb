class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_image_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  geocoded_by :address
  after_validation :geocode

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_image_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, post_image_comment_id)
    temp_ids = PostImageComment.select(:user_id).where(post_image_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, post_image_comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, post_image_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, post_image_comment_id, visited_id)
    notification = current_user.active_notifications.new(
      post_image_id: id,
      post_image_comment_id: post_image_comment_id,
      visited_id: visited_id,
      action: "comment"
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
