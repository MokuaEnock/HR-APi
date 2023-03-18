class SessionsController < ApplicationController

  def create
user = User.find_by(email: params[:email])
if user && user.authenticate(paramsp[:password])
  jwt = encode_token(user_id: user.id)
  render json: {jwt: jwt}
else
  render json: {error: "Invalid email or password"}, status: :unprocessable_entity
end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
