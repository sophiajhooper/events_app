require "rails_helper"

RSpec.describe "attendees#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attendees/#{attendee.id}", params: params
  end

  describe "basic fetch" do
    let!(:attendee) { create(:attendee) }

    it "works" do
      expect(AttendeeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("attendees")
      expect(d.id).to eq(attendee.id)
    end
  end
end
