class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def show
    @order=Order.find(params[:id])
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.products = current_user.cart.products_carts.map { |val| [val.product.id, val.quantity] }.to_h

    if @order.save
      current_user.cart.clear!
      flash[:success] = 'Your order has been placed!'
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:city, :address, :phone)
  end
end
