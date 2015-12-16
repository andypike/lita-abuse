require "spec_helper"

RSpec.describe Lita::Handlers::Abuse, :lita_handler => true do
  let(:robot) { Lita::Robot.new(registry) }

  subject { described_class.new(robot) }

  describe "#abuse" do
    it { is_expected.to route("Lita abuse Andy") }

    it "works" do
      send_message("Lita abuse Andy")
      expect(replies.last).to match(/Andy you are a (\w+\s)(\w+\s)(\w+\s*)/)
    end
  end
end
