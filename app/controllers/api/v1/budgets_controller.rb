class Api::V1::BudgetsController < ApplicationController
  def show
    @budget = Budget.find(params[:id])
  end
end
