class PagesController < ApplicationController
  def page
    render template: "pages/#{params[:page]}"
  end
end
