require "rails_helper"

RSpec.describe MainController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("main#index")
    end

    it "routes to #rewards" do
      expect(:get => "/rewards").to route_to("main#rewards")
    end

    it "routes to #redeem_reward" do
      expect(:post => "/redeem_reward").to route_to("main#redeem_reward")
    end

  end
end
