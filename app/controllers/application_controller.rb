# Application controller
# handles auth logic for JWT encoding / decoding

# example JS:
# fetch("/", {
#   method: "post",
#   headers: {
#     "Content-Type": "application/json",
#     Authorization: `bearer ${JWT_TOKEN}`,
#   },
#   body: JSON.stringify(requestBody),
# })
class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, ENV['WAX_KEY'])
  end

  def auth_header
    request.headers['Authorization']
  end

  # rubocop:disable Style/GuardClause, Style/RedundantArgument
  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV['WAX_KEY'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end
  # rubocop:enable Style/GuardClause, Style/RedundantArgument

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
