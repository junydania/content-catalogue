class PublishersController < ApplicationController
  load_and_authorize_resource
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


  private

  def publisher_param
    params.require(:publisher)
        .permit(:publisher_name)
  end
end




