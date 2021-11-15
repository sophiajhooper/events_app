require "rails_helper"

RSpec.describe "attendees#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attendees", params: params
  end

  describe "basic fetch" do
    let!(:attendee1) { create(:attendee) }
    let!(:attendee2) { create(:attendee) }

    it "works" do
      expect(AttendeeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["attendees"])
      expect(d.map(&:id)).to match_array([attendee1.id, attendee2.id])
    end
  end
end
