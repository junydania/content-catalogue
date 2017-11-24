class ProfilesController < ApplicationController

  def show
    @user = User.friendly.find(current_user.id)
  end

end

