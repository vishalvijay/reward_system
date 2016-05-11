require "rails_helper"

RSpec.describe MainController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/main").to route_to("main#index")
    end

  end
end