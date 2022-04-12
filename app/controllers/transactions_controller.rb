class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    case current_user.role
    when 'Scholar'
    @transaction = Transaction.new(transaction_params)
    @transaction.scholar = @scholar
    @transaction.scholar_id = params[:scholar_id]
    if @transaction.save
      redirect_to dashboard_path
    else
      render :new
    end
    when 'Donor'
    @transaction = Transaction.new(transaction_params)
    @transaction.donor = @donor
    @transaction.donor_id = params[:donor_id]
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
