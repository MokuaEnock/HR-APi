class UsersController < ApplicationController
before_action :authenticate_user

def index
@users = User.all
render json: @users

end

private


def authenticate_user
token = request.headers['Authorization']

if token
decoded_token = decoded_token(token)
@current_user = User.find_by(id: decoded_token['user_id'])

end

unless @current_user
render json: {error: "Unauthorized"}, status: :unauthorized
end

end

def decode_token(token)
begin
JWT.decode(token, Rails.appllication.secrets.secret_key_base)[0]
rescue JWT::DecodeError
{}
end

end
end
