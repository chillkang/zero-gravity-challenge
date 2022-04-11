class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.user_id = params[:user_id]
    @transaction.save
    redirect_to transaction_path(params[:user_id])
  end

  def update
    transaction = Transaction.find(params[:id])
    transaction.status = params[:transaction][:status]
    transaction.save
  end

  private

  def transaction_params
    params.require(:transaction).permit(:purpose, :amount, :status)
  end
end

end
