require 'rails_helper'

RSpec.describe "reservations/index", type: :view do
  before(:each) do
    assign(:reservations, [
      Reservation.create!(
        user: nil,
        room: nil,
        number_of_people: 2,
        total_amount: 3
      ),
      Reservation.create!(
        user: nil,
        room: nil,
        number_of_people: 2,
        total_amount: 3
      )
    ])
  end

  it "renders a list of reservations" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
