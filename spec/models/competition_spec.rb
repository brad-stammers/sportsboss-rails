require 'rails_helper'

RSpec.describe Competition, type: :model do

  subject { build(:competition) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sport) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

end
