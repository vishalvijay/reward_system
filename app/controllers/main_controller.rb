class MainController < ApplicationController
  before_action :authenticate_user!
  PER_PAGE = 16

  def index
    @coupons = current_user.coupons.includes(:reward)
  end

  def rewards
    @page = params[:page] || 1
    @query = params[:query]
    @rewards = if @query.blank?
      Reward.page(@page).per(PER_PAGE)
    else
      q = @query
      p = @page
      Sunspot.search(Reward) do
        fulltext("\"#{q}\"^5 OR #{q}~1") do
          boost_fields name: 2.0
        end
        paginate page: p, per_page: PER_PAGE
      end.results
    end
    respond_to do |format|
      format.html
      format.json {render json: @rewards}
    end
  end

  def redeem_reward
    respond_to do |format|
      if params[:reward_id].present?
        reward = Reward.find(params[:reward_id])
        result = current_user.redeem(reward)
        unless result
          format.html { redirect_to_back(default: rewards_path, notice: "#{reward.name} coupon is successfully redeemed, checkout your profile more for details")}
          format.json {render json: {message: "#{reward.name} coupon is successfully redeemed"}}
        else
          format.html {redirect_to_back(default: rewards_path, flash: {error: result})}
          format.json {render json: {error: result}, status: :bad_request}
        end
      else
        format.html { render_404}
        format.json {render json: {error: "Required parameter missing"}, status: :not_found}
      end
    end
  end
end
