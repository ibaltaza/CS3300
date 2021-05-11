class UsersController < ApplicationRecord
    before_commit :authenticate_user!
    user_signed_in?
    current_user
    user_session
end
