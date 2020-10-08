class ScenariosController < ApplicationController
  include SessionsHelper
  def index
    @q = Scenario.ransack(params[:q])
    @scenarios = @q.result(distinct: true).order(price: "ASC").page(params[:page]).per(10)
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  def new
    @writer = Writer.find_by(id: current_player.writer_id)
  end

  def create
    @writer = Writer.find_by(id: params[:scenario][:writer_id])
    @scenario = @writer.scenarios.create(scenario_params)
    redirect_to scenario_path(@scenario)
  end

  private

  def scenario_params
    params.require(:scenario).permit(:title, :player_number, :play_time, :gm, :scenario_link, :price, :summary)
  end

end