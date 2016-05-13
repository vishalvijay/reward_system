class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @coupons = current_user.coupons.includes(:reward)
  end

  def rewards
    @page = params[:page] || 1
    @query = params[:query]
    @rewards = if @query.blank?
      Reward.page(@page).per(16)
    else
      q = @query
      p = @page
      Sunspot.search(Reward) do
        fulltext("\"#{q}\"^5 OR #{q}~1") do
          boost_fields name: 2.0
        end
        paginate page: p, per_page: 16
      end.results
    end
    respond_to do |format|
      format.html
      format.json {render json: @rewards}
    end
  end

  def redeem_reward
    reward = Reward.find(params[:reward_id])
    result = current_user.redeem(reward)
    respond_to do |format|
      unless result
        format.html { redirect_to :back, notice: "#{reward.name} coupon is successfully redeemed, checkout your profile more for details" }
        format.json {render json: {message: "#{reward.name} coupon is successfully redeemed"}}
      else
        format.html { redirect_to :back, flash: {error: result }}
        format.json {render json: {error: result}, status: :bad_request}
      end
    end
  end
end
