class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_image_comments, dependent: :destroy
  

end
