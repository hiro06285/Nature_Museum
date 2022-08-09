class PostImageComment < ApplicationRecord

  belongs_to :user
  belongs_to :post_image

  validates :post_image_comment, presence: true

end
