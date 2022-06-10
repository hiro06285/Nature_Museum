require 'rails_helper'

RSpec.describe 'Notificationモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { notification.valid? }
  end

  describe 'アソシエーションのテスト' do
    context 'PostImageモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:post_image).macro).to eq :belongs_to
      end
    end
  end
end