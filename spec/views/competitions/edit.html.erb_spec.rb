require 'rails_helper'

RSpec.describe "competitions/edit", type: :view do
  let(:competition) {
    Competition.create!(
      name: "MyString",
      sport: "MyString",
      start_date: "2024-01-03",
      end_date: "2024-03-03",
      venue: "MyString",
      manager: "MyString"
    )
  }

  before(:each) do
    assign(:competition, competition)
  end

  it "renders the edit competition form" do
    render

    assert_select "form[action=?][method=?]", competition_path(competition), "post" do

      assert_select "input[name=?]", "competition[name]"

      assert_select "input[name=?]", "competition[sport]"

      assert_select "input[name=?]", "competition[start_date]"

      assert_select "input[name=?]", "competition[end_date]"

      assert_select "input[name=?]", "competition[venue]"

      assert_select "input[name=?]", "competition[manager]"
    end
  end
end
