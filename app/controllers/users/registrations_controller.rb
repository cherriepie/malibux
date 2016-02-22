class Users::RegistrationsController < Devise::RegistrationsController

  # def create
  #   super
  # end

  # Because of Rails strong parameter we need to use the Registration controller Override
  # to sanitize inputs
  # Devise automatically knows wich one to use
  private
  def sign_up_params
  params.require(:user).permit( :name, :email, :password,:password_confirmation,
  tenant_attributes:[:id])
  end
  def account_update_params
    # For updates we make sure to let the Company ID pass through or the form will
    # generate a new company every time we edit our details
    params.require(:user).permit(:name, :email,:password, :password_confirmation, :current_password,
    team_attributes: [:id])
  end

end
