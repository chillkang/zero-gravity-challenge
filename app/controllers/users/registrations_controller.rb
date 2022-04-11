class Users::RegistrationsController < Devise::RegistrationsController

# GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    puts 'creating user'
    super
  end

  protected

  def after_sign_up_path_for(resource)
    p "registrations"
    if resource.save!
      if resource.role == "Donor"
        new_user_donor_path(resource)
      elsif resource.role == "Scholar"
        new_user_scholar_path(resource)
      end
    else
      render :new
    end
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

end
