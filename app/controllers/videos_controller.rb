class VideosController < ApplicationController

  def index
  end

  def new
    @video = Video.new
    @comedians = Comedian.all
    @publishers = Publisher.all
    @categories = Category.all
  end

  def create
    @video = Video.new(video_params)
    @video.category_id = params[:video][:category_id]
    @video.publisher_id = params[:video][:publisher_id]
    @video.comedian_id = params[:video][:comedian_id]
    if @video.save
      redirect_to videos_path
      flash[:notice] = "Video successfully added"
    else
      render new
    end

  end


  private

  def video_params
    params.require(:video)
        .permit(:title,
                :description,
                :release_date,
                :video_storage_path,
                :comedian_id,
                :image,
                :category_id,
                :publisher_id,
              )
  end
end


