class Admin::OrdersController < AdminBaseController
  def index
    @orders = Order.select { |order| !order.accepted? }
  end

  def destroy
    order = Order.find(params[:id])
    flash[:danger] = 'Order rejected!' if order.destroy
    redirect_to admin_orders_url
  end

  def accept!
    order = Order.find(params[:id])
    flash[:success] = 'Order accepted!' if order.update(accepted: true)
    redirect_to admin_orders_url
  end
end
