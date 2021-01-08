require 'rails_helper'

RSpec.describe 'Userモデル', type: :model do
  describe 'バリデーション' do
    let(:user) { create(:user) }
    subject { user.valid? }
    it 'ユーザーが作成できること' do
      is_expected.to eq true
    end

    context 'name' do
      it '空欄ではないこと' do
        user.name = ''
        is_expected.to eq false
      end

      it '重複していないこと' do
        another_user = build(:user, name: user.name)
        expect(another_user).not_to be_valid
      end

      it "50文字以内であること" do
        user.name = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
    end

    context 'email' do
      it '空欄ではないこと' do
        user.email = ''
        is_expected.to eq false
      end

      it '重複していないこと' do
        another_user = build(:user, email: user.email)
        expect(another_user).not_to be_valid
      end
    end

    context 'description' do
      it '1000文字以内であること' do
        user.description = Faker::Lorem.characters(number:2000)
        is_expected.to eq false
      end
    end
  end
end
