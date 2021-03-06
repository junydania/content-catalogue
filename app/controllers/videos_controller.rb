class VideosController < ApplicationController
  load_and_authorize_resource  param_method: :video_params, find_by: :slug
  skip_authorize_resource :index, :show

  before_action :authenticate_user!

  def index
    @filterrific = initialize_filterrific(
        Video.with_comedian_details,
        params[:filterrific],
        select_options: {
            with_comedian_id: Comedian.options_for_select,
            with_publisher_id: Publisher.options_for_select,
            with_category_id: Category.options_for_select,
            sorted_by: Video.options_for_sorted_by
        },
        persistence_id: 'shared_key',
        default_filter_params: {},
    ) or return
    @videos = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
      filename = "videos-#{Date.today}.csv"
      format.csv { send_data @videos.to_csv, filename: filename}
      format.xlsx {set_attachment_name "#{filename}.xlsx" }
    end

  rescue ActiveRecord::RecordNotFound => e
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) && return
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

  def show
    @video = Video.friendly.find(params[:id])
  end


  def edit
    @comedians = Comedian.all
    @publishers = Publisher.all
    @categories = Category.all
    @video = Video.friendly.find(params[:id])
  end

  def update
    @video = Video.friendly.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to  video_path(@video)
      flash[:notice] = 'Video successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @video = Video.friendly.find(params[:id])
    @video.destroy
    redirect_to videos_path
    flash[:notice] = "Video successfully deleted"
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
