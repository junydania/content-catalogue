class VideosController < ApplicationController

  def index
  end

  def new
    @video = Video.new
    @comedians = Comedian.all
    @publishers = Publisher.all
    @categories = Category.all
  end
end


