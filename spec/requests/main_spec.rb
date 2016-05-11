require 'rails_helper'

RSpec.describe "Main", type: :request do
  describe "GET /main" do
    it "works! (now write some real specs)" do
      get mains_path
      expect(response).to have_http_status(200)
    end
  end
end
