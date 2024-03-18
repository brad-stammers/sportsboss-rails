require 'rails_helper'

RSpec.describe "competitions/index", type: :view do
  before(:each) do
    assign(:competitions, [
      Competition.create!(
        name: "Name",
        sport: "Sport",
        start_date: "2024-01-03",
        end_date: "2024-03-03",
        venue: "Venue",
        manager: "Manager"
      ),
      Competition.create!(
        name: "Name",
        sport: "Sport",
        start_date: "2024-01-03",
        end_date: "2024-03-03",
        venue: "Venue",
        manager: "Manager"
      )
    ])
  end

  it "renders a list of competitions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'tr>td' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sport".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("2024-01-03".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("2024-03-03".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Venue".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Manager".to_s), count: 2
  end
end
