require "rails_helper"

RSpec.describe "attendees#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/attendees/#{attendee.id}", payload
  end

  describe "basic update" do
    let!(:attendee) { create(:attendee) }

    let(:payload) do
      {
        data: {
          id: attendee.id.to_s,
          type: "attendees",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AttendeeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { attendee.reload.attributes }
    end
  end
end
