require 'rails_helper'

RSpec.describe 'PostImageCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_image_comment.valid? }

    let(:user) { create(:user) }
    let!(:pot_image_comment) { build(:pot_image_comment, user_id: user.id) }

    context 'post_image_commentカラム' do
      it '空欄でないこと' do
        post_image_comment.post_image_comment = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImageComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    
    context 'PostImageモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImageComment.reflect_on_association(:post_image).macro).to eq :belongs_to
      end
    end
  end
end