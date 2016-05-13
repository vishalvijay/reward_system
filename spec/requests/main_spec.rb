require 'rails_helper'

RSpec.describe "Main", type: :request do
  describe "GET /" do

    it "with out authetication" do
      get root_path
      expect(response).to have_http_status(302)
    end

    it "with authetication" do
      sign_in_as_a_valid_user
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /rewards" do

    it "with out authetication" do
      get rewards_path
      expect(response).to have_http_status(302)
    end

    it "with authetication" do
      sign_in_as_a_valid_user
      get rewards_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /redeem_reward" do

    it "with out authetication" do
      post redeem_reward_path
      expect(response).to have_http_status(302)
    end

    it "with out required params" do
      sign_in_as_a_valid_user
      post redeem_reward_path
      expect(response).to have_http_status(404)
    end

    it "with required params" do
      sign_in_as_a_valid_user create(:user_with_points)
      reward = create(:reward)
      post redeem_reward_path, reward_id: reward.id
      expect(response).to have_http_status(302)
    end
  end
end
