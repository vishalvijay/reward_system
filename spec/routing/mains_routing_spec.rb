require "rails_helper"

RSpec.describe MainsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mains").to route_to("mains#index")
    end

  end
end
