class PublishersController < ApplicationController

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_param)
    if @publisher.save
      redirect_to publishers_path
      flash[:notice] = 'Publisher successfully added'
    end
  end


  private

  def publisher_param
    params.require(:publisher)
        .permit(:publisher_name)
  end
end


