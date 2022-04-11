class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def new
    @donor = Donor.find(params[:scholar_id])
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    case current_user.role
    when 'donor'
    @transaction = Transaction.new(transaction_params)
    @transaction.donor = @donor
    # @transaction.donor_id = params[:donor_id]
    # @transaction.user = current_user
    @transaction.save
    redirect_to donor_transactions_path
    when 'scholar'
    @transaction = Transaction.new(transaction_params)
    @transaction.scholar = @scholar
    @transaction.save
    redirect_to donor_transactions_path
    end
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
