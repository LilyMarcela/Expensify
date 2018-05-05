class ExpensesController < ApplicationController
  def Index
    transaction_type = params["transaction_type"]
    category = params[:category]
    if transaction_type
        puts "ENTRA TransactionType"
        @expenses = Expense.joins(:transaction_type, :category).where("transaction_types.name = ?", transaction_type).limit(10)
    else
      @expenses = Expense.last(10)
    end    
    @transaction_types = TransactionType.all
    @categories = Category.all
    respond_to do |format|
        format.html {render :Index}
        format.json {render json: @expenses, status: :ok}
        format.js{ render partial: "expenses_list", locals: { marcela: @expenses }}
    end
  end
end
