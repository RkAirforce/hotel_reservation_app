require 'rails_helper'

RSpec.describe "Roomモデル", type: :model do
  describe 'バリデーション' do
    before do
      user = create(:user)
      @room = user.rooms.build(
        name: Faker::Lorem.characters(number: 10),
        description: Faker::Lorem.characters(number: 20),
        price: rand(100..9999),
        address: Faker::Address.city,
        new_room_img: Faker::Avatar.image
      )
    end

    subject { @room.valid? }

    it 'ユーザーが作成できること' do
      is_expected.to eq true
    end

    context 'name' do

    end

    context 'description' do

    end

    context '' do

    end

    context '' do

    end

    context '' do

    end
  end
end
