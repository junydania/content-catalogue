class ComediansController < ApplicationController
  load_and_authorize_resource param_method: :comedian_param, find_by: :slug
  skip_authorize_resource only: :index

  def index
    @comedians = Comedian.all
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(comedian_param)
    if @comedian.save
      flash[:notice] = 'Comedian successfully added'
      redirect_to request.referrer
    else
      flash[:notice]= "Sorry! You must enter a name"
      redirect_to new_comedian_path
    end
  end

  def edit
    @comedian = Comedian.friendly.find(params[:id])
  end

  def update
    @comedian = Comedian.friendly.find(params[:id])
    if @comedian.update_attributes(comedian_param)
      redirect_to  comedians_path
      flash[:notice] = "Comedian's record successfully updated"
    else
      render 'edit'
    end
  end


  def comedian_param
    params.require(:comedian)
          .permit(:name)
  end

end

