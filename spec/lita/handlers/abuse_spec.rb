require "spec_helper"

RSpec.describe Lita::Handlers::Abuse, :lita_handler => true do
  let(:robot) { Lita::Robot.new(registry) }

  subject { described_class.new(robot) }

  describe "#abuse" do
    it { is_expected.to route("Lita abuse Andy") }
    it { is_expected.to route("Lita abuse @andy") }

    it "responses to names that are not mentions" do
      send_message("Lita abuse Andy")
      expect(replies.last).to match(/Andy you are a (\w+\s)(\w+\s)(\w+\s*)/)
    end

    it "responses to mentions" do
      send_message("Lita abuse @andy")
      expect(replies.last).to match(/<@andy> you are a (\w+\s)(\w+\s)(\w+\s*)/)
    end
  end
end
