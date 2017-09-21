class Consumers::InvitationsController < ApplicationController
  before_action :restrict_service_providers

  def index
    @users = set_users
  end

  def create
    User.invite!({email: invitation_params[:email], type: 'ServiceProvider'}, current_user)
    @users = set_users
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def set_users
    ServiceProvider.where(invited_by: current_user)
  end
end
