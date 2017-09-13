class ComediansController < ApplicationController

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(comedian_param)
    if @comedian.save
      flash[:notice] = 'Comedian successfully added'
      redirect_to request.referrer
    else
      render new
    end

  end


  def comedian_param
    params.require(:comedian)
          .permit(:name)
  end

end
