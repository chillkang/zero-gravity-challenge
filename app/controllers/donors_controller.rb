class DonorsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :find_donor, only: %i[show edit update]

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    @donor.user = @user
    if @donor.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @donor.update(donor_params)
    redirect_to user_path(@donor)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def find_donor
    @donor = Donor.find(params[:id])
  end

  def donor_params
    params.require(:donor).permit(:company_name, :bank_name, :bank_account)
  end
end
