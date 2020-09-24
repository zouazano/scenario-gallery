class ScenariosController < ApplicationController

  def index
    @q = Scenario.ransack(params[:q])
    @scenarios = @q.result(distinct: true).order(price: "ASC").page(params[:page]).per(10)
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

end