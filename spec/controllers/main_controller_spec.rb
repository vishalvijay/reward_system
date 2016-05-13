require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe 'GET #index' do
    signed_in_as_a_valid_user
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #rewards' do
    signed_in_as_a_valid_user
    it "renders the :rewards template" do
      get :rewards
      expect(response).to render_template :rewards
    end
  end

  describe 'POST #redeem_reward' do
    signed_in_as_a_valid_user
    it "with params" do
      post :redeem_reward
      expect(response).to have_http_status(404)
    end

    it "with params" do
      post :redeem_reward, reward_id: create(:reward).id
      expect(response).to redirect_to(rewards_url)
    end

    describe "with_points" do
      signed_in_as_a_valid_user FactoryGirl.create(:user_with_points)
      it "with params" do
        post :redeem_reward, reward_id: create(:reward).id
        expect(response).to redirect_to(rewards_url)
      end
    end
  end
end
