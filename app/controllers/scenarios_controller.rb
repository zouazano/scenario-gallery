class ScenariosController < ApplicationController

  def index
    @scenarios = Scenario.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

end