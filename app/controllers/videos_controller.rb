class VideosController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @comedian= Comedian.all
    @publisher = Publisher.all
    @category = Category.all
    @video = Video.search(params[:search])
                 .order(sort_column + " " + sort_direction)
                 .paginate(:per_page => 50, :page => params[:page])

    @filterrific = initialize_filterrific(
                       Video,
                       params[:filterrific]
    ) or return
    @videos = @filterrific.find.page(params[:page])

    respond_to do |format|
        format.html
        format.js
    end

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
      flash[:notice] = "Video successfully added"
      redirect_to new_video_path
    else
      flash[:notice] = "Sorry can't save video until all fields are filled"
      redirect_to  new_video_path
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

  def sort_column
    Video.column_names.include?(params[:sort]) ? params[:sort] : "Title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


end


