class ItemsController < ApplicationController

  rescue_from RuntimeError, :with => :show_errors

  def index; end

  def import
    @items = Item.import(params[:file])
    
    render action: "index",  locals: { items: @items }
  end

  def download_pdf
    send_data(generate_pdf, :filename => "your_report.pdf", :type => "application/pdf")
  end

  def show_errors(exception)
    flash[:notice] = "Exception: #{exception.message}"
    redirect_to root_url
  end

end
