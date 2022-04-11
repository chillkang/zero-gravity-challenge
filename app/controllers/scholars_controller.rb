class ScholarsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :find_scholar, only: %i[show edit update]

  def index
    @scholars = Scholar.all
  end

  def new
    @scholar = Scholar.new
  end

  def create
    @scholar = Scholar.new(scholar_params)
    @scholar.user = @user
    if @scholar.save
      redirect_to root_path
    else
      render :new
    end
  end

  def dashboard
    @scholars = current_user.scholars
    @active_transactions= []
    @scholars.each do |scholar|
      scholar.transaction.each do |scholar|
        @active_transactions << transaction
      end
    end
  end

  def show
    @Transaction = Transaction.new
  end


  def edit; end

  def update
    @scholar.update(scholar_params)
    redirect_to user_path(@scholar)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_scholar
    @scholar = Scholar.find(params[:id])
  end

  def scholar_params
    params.require(:scholar).permit(:institution_name, :bank_name, :bank_account)
  end
end
