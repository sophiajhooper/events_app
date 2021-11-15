require "rails_helper"

RSpec.describe "attendees#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/attendees/#{attendee.id}"
  end

  describe "basic destroy" do
    let!(:attendee) { create(:attendee) }

    it "updates the resource" do
      expect(AttendeeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Attendee.count }.by(-1)
      expect { attendee.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
