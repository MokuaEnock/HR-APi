class UsersController < ApplicationController
  def authenticate
    user = User.find_by(email: paras[:email])
    if user && authenticate(params[:password])
      #authentication successful
    else
      #authentication failed
    end
  end

end
