class PostImageComment < ApplicationRecord

  belongs_to :user
  belongs_to :post_image

  #validates :post_image_comment, presence: true
  validates :post_image_comment, length:{ minimum: 1, maximum: 5}


end
