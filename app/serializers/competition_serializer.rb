class CompetitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :sport, :start_date, :end_date, :venue, :manager
end
