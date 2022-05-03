class Api::V1::BudgetsController < ApplicationController
  def show
    @budget =
      Budget
        .selecting_table_columns
        .selecting_total_contributions
        .selecting_total_disbursements
        .selecting_total_cash_on_hand
        .find(params[:id])
  end
end
