class ComediansController < ApplicationController

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(comedian_param)
    if @comedian.save
      redirect_to comedians_path
      flash[:notice] = 'Comedian successfully added'
    else
      render new
    end

  end


  def comedian_param
    params.require(:comedian)
        .permit(:name)
  end

end
