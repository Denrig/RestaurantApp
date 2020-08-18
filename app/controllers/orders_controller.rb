class OrdersController < ApplicationController
  include OrdersHelper

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.new(order_params)
    # Save the products as a hash { product_id: quantity }
    @order.products = current_user.cart.products_carts.map { |product| [product.product.id, product.quantity] }.to_h
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
