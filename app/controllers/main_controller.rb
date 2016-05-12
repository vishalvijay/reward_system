class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def rewards
    flash[:notice] = "Widget was successfully created."
    @rewards = Reward.page(params[:page] || 1).per(16)
  end

  def redeem_reward
    reward = Reward.find(params[:reward_id])
  end
end
