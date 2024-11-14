class UserController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user

    render({ :template => "user/show" })
  end
end
