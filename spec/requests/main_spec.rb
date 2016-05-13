require 'rails_helper'

RSpec.describe "Main", type: :request do
  describe "GET /" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(302)
    end
  end
end
