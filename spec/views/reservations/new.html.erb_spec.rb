require 'rails_helper'

RSpec.describe "reservations/new", type: :view do
  before(:each) do
    assign(:reservation, Reservation.new(
      user: nil,
      room: nil,
      number_of_people: 1,
      total_amount: 1
    ))
  end

  it "renders new reservation form" do
    render

    assert_select "form[action=?][method=?]", reservations_path, "post" do

      assert_select "input[name=?]", "reservation[user_id]"

      assert_select "input[name=?]", "reservation[room_id]"

      assert_select "input[name=?]", "reservation[number_of_people]"

      assert_select "input[name=?]", "reservation[total_amount]"
    end
  end
end
