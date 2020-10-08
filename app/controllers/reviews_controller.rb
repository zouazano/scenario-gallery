class ReviewsController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token
  include SessionsHelper
  #before_action :logged_in_player

  def create
    @scenario = Scenario.find(params[:review][:scenario_id])
    unless @scenario.review_added?(current_player)
      @scenario.add_review(review_params)
      redirect_to scenario_path(@scenario)
    end
  end

  def destroy
    @scenario = Review.find(params[:id]).scenario
    if @scenario.review_added?(current_player)
      @scenario.remove_review(current_player)
      redirect_to scenario_path(@scenario)
    end
  end

  private

  def review_params
    params.require(:review).permit(:player_id, :scenario_id, :score, :content, :spoiler, {:fellow_player_ids => []})
  end

end