class HomesController < ApplicationController
  def top
    @post_image = PostImage.order('id DESC').limit(4)
  end
end
