require 'rails_helper'

RSpec.describe "rooms/edit", type: :view do
  before(:each) do
    @room = assign(:room, Room.create!(
      user: nil,
      name: "MyString",
      description: "MyText",
      price: 1,
      address: "MyString"
    ))
  end

  it "renders the edit room form" do
    render

    assert_select "form[action=?][method=?]", room_path(@room), "post" do

      assert_select "input[name=?]", "room[user_id]"

      assert_select "input[name=?]", "room[name]"

      assert_select "textarea[name=?]", "room[description]"

      assert_select "input[name=?]", "room[price]"

      assert_select "input[name=?]", "room[address]"
    end
  end
end
