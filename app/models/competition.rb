class Competition < ApplicationRecord

  validates :name, :sport, :start_date, :end_date, presence: true

end
