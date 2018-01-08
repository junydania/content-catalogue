class PublishersController < ApplicationController
  load_and_authorize_resource param_method: :publisher_param, find_by: :slug
  skip_authorize_resource only: :index

  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_param)
    if @publisher.save
      flash[:notice] = 'Publisher successfully added'
      redirect_to new_publisher_path
    else
      render new
    end
  end

  def edit
    @publisher = Publisher.friendly.find(params[:id])
  end

  def update
      @publisher = Publisher.friendly.find(params[:id])
      if @pubisher.update_attributes(publisher_param)
        redirect_to  publishers_path
        flash[:notice] = "Publisher's record successfully updated"
      else
        render 'edit'
      end
  end


  private

  def publisher_param
    params.require(:publisher)
        .permit(:publisher_name)
  end
end




