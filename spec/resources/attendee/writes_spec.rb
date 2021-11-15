require "rails_helper"

RSpec.describe AttendeeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "attendees",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AttendeeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Attendee.count }.by(1)
    end
  end

  describe "updating" do
    let!(:attendee) { create(:attendee) }

    let(:payload) do
      {
        data: {
          id: attendee.id.to_s,
          type: "attendees",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AttendeeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { attendee.reload.updated_at }
      # .and change { attendee.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:attendee) { create(:attendee) }

    let(:instance) do
      AttendeeResource.find(id: attendee.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Attendee.count }.by(-1)
    end
  end
end
