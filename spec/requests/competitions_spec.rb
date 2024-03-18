require 'rails_helper'

RSpec.describe "/competitions", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Competition. As you add validations to Competition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:competition)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:competition_invalid)
  }
  let(:valid_headers) {
      {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Competition.create! valid_attributes
      get competitions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      competition = FactoryBot.create :competition
      get competition_url(competition)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Competition" do
        expect {
          post competitions_url, params: { competition: valid_attributes }
        }.to change(Competition, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Competition" do
        expect {
          post competitions_url, params: { competition: invalid_attributes }
        }.to change(Competition, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post competitions_url, params: { competition: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { sport: "Rugby League" }
      }

      it "updates the requested competition" do
        competition = Competition.create! valid_attributes
        patch competition_url(competition), params: { competition: new_attributes }
        competition.reload
        expect(competition.sport).to eq('Rugby League')
      end

      it "redirects to the competition" do
        competition = Competition.create! valid_attributes
        patch competition_url(competition), params: { competition: new_attributes }
        competition.reload
        expect(response).to redirect_to(competitions_url)
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        competition = Competition.create! valid_attributes
        patch competition_url(competition), params: { competition: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested competition" do
      competition = Competition.create! valid_attributes
      expect {
        delete competition_url(competition)
      }.to change(Competition, :count).by(-1)
    end

    it "redirects to the competitions list" do
      competition = Competition.create! valid_attributes
      delete competition_url(competition)
      expect(response).to redirect_to(competitions_url)
    end
  end

end
