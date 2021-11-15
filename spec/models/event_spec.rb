require "rails_helper"

RSpec.describe Event, type: :model do
  describe "Direct Associations" do
    it { should have_many(:attendees) }

    it { should have_many(:comments) }

    it { should belong_to(:host) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
