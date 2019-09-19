class UsersController < ApplicationController

  def index
    
  end
  def show
    redirect_to root_path
  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    auth_token = params.require(:code)
    user = User.find_by(id: @user["id"])

    if user.present?
      if user.auth_token != auth_token
        user.auth_token = auth_token
        user.save!
      # redirect_to root_path
      end
    else
      user = User.create(uid: @user["id"], auth_token: auth_token, name: @user["name"])
      current_user = user
    end

    current_user = user
    @user = current_user

    # redirect_to root_path
  end

  def sign_out
    current_user.destroy
    redirect_to root_path
  end

end