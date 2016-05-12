class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def rewards
    @rewards = Reward.page(params[:page] || 1).per(16)
  end

  def redeem_reward

  end
end
