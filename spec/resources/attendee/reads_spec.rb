require "rails_helper"

RSpec.describe AttendeeResource, type: :resource do
  describe "serialization" do
    let!(:attendee) { create(:attendee) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(attendee.id)
      expect(data.jsonapi_type).to eq("attendees")
    end
  end

  describe "filtering" do
    let!(:attendee1) { create(:attendee) }
    let!(:attendee2) { create(:attendee) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: attendee2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([attendee2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:attendee1) { create(:attendee) }
      let!(:attendee2) { create(:attendee) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      attendee1.id,
                                      attendee2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      attendee2.id,
                                      attendee1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
