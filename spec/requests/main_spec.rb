require 'rails_helper'

RSpec.describe "Main", type: :request do
  describe "GET /" do
    it "works! (now write some real specs)" do
      sign_in_as_a_valid_user
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
