class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.author = current_user
    @category = Category.find(params[:category_id])
    @payment.categories << @category
    if @payment.save
      flash[:notice] = 'Transaction added successfully'
      redirect_to category_path(params[:category_id])
    else
      flash[:alert] = @payment.errors.first.message
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
