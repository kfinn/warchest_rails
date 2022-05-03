class Api::V1::BudgetsController < ApplicationController
  def show
    @budget =
      Budget
        .select_table_columns
        .select_total_contributions
        .select_total_disbursements
        .select_total_cash_on_hand
        .find(params[:id])
  end
end
