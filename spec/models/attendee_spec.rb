require "rails_helper"

RSpec.describe Attendee, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:event) }

    it { should belong_to(:attendee) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
