json.extract! competition, :id, :name, :sport, :start_date, :end_date, :venue, :manager, :created_at, :updated_at
json.url competition_url(competition, format: :json)
