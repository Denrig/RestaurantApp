class OrdersController < ApplicationController
  before_action :correct_user, only: %i[show]
  include OrdersHelper

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
    flash[:info] = 'You don`t have any order yet!' if @orders.count.zero?
  end

  def create
    @order = current_user.orders.new(order_params)
    current_user.cart.products_carts.each do |product_cart|
      product_order = ProductOrder.new(product: product_cart.product, price: product_cart.product.price, quantity: product_cart.quantity)
      @order.product_orders << product_order
    end
    if @order.save
      current_user.cart.clear!
      flash[:success] = 'Your order has been placed!'
      redirect_to current_user
    else
      flash[:danger]='Something went wrong while placeing the order!'
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:city, :address, :phone)
  end

  def correct_user
    @user=Order.find(params[:id]).user
    check_user(@user)
  end
end
