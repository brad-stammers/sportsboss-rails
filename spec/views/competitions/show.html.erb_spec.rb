require 'rails_helper'

RSpec.describe "competitions/show", type: :view do
  before(:each) do
    assign(:competition, Competition.create!(
      name: "Name",
      sport: "Sport",
      start_date: "2024-01-03",
      end_date: "2024-03-03",
      venue: "Venue",
      manager: "Manager"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sport/)
    expect(rendered).to match(/2024-01-03/)
    expect(rendered).to match(/2024-03-03/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/Manager/)
  end
end
