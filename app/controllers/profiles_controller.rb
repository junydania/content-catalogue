class ProfilesController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to  video_path(@video)
      flash[:notice] = 'Video successfully updated'
    else
      render 'edit'
    end
  end


end
