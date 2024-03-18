FactoryBot.define do

  factory :competition do
    name { "MyString" }
    sport { "MyString" }
    start_date { "2024-03-18" }
    end_date { "2024-03-18" }
    venue { "MyString" }
    manager { "MyString" }
  end

  factory :competition_invalid, class: Competition do
    name { "" }
    sport { "" }
    start_date { "" }
    end_date { "" }
    venue { "" }
    manager { "" }
  end

end
