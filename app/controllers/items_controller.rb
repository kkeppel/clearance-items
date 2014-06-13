class ItemsController < ApplicationController

  rescue_from RuntimeError, :with => :show_errors

  def index; end

  def import
    Item.import(params[:file])
    redirect_to root_url, notice: "CSV was successfully imported."
  end

  def show_errors(exception)
    flash[:notice] = "Exception: #{exception.message}"
    redirect_to root_url
  end

end
