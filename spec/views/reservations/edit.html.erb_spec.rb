require 'rails_helper'

RSpec.describe "reservations/edit", type: :view do
  before(:each) do
    @reservation = assign(:reservation, Reservation.create!(
      user: nil,
      room: nil,
      number_of_people: 1,
      total_amount: 1
    ))
  end

  it "renders the edit reservation form" do
    render

    assert_select "form[action=?][method=?]", reservation_path(@reservation), "post" do

      assert_select "input[name=?]", "reservation[user_id]"

      assert_select "input[name=?]", "reservation[room_id]"

      assert_select "input[name=?]", "reservation[number_of_people]"

      assert_select "input[name=?]", "reservation[total_amount]"
    end
  end
end
