class BookmarksController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token
  include SessionsHelper
  #before_action :logged_in_player

  def create
    @scenario = Scenario.find(params[:scenario_id])
    unless @scenario.add?(current_player)
      @scenario.add(current_player)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js {render layout: false}
      end
    end
  end

  def destroy
    @scenario = Bookmark.find(params[:id]).scenario
    if @scenario.add?(current_player)
      @scenario.remove(current_player)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js {render layout: false}
      end
    end
  end

end