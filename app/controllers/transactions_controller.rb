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
    when 'Donor'
    @transaction = Transaction.new(transaction_params)
    @transaction.donor = @donor
    if @transaction.save
      redirect_to dashboard_path
    else
      render :new
    end
    when 'Scholar'
    @transaction = Transaction.new(transaction_params)
    @transaction.scholar = @scholar
    if @transaction.save
      redirect_to dashboard_path
    else
      render :new
    end
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
