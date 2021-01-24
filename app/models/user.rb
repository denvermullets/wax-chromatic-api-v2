class User < ApplicationRecord
  # has_secure_password
  # validates :email, :wax_username, uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :collection
  has_one :wantlist
end
