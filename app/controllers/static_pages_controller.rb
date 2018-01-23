class StaticPagesController < ApplicationController
  def about; end

  def contact
    @inquiry = Inquiry.new
  end

  def send_inquiry
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.deliver
      flash[:success] = "Your inquiry is received!"
      redirect_to root_path
    else
      render :contact
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email_address, :content)
  end
end
