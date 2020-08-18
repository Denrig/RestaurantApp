class Admin::OrdersController < AdminBaseController
  def index
    @orders = Order.where(accepted: true)
  end

  def destroy
    flash[:danger] = 'Order rejected!' if Order.find(params[:id]).destroy
    redirect_to admin_orders_url
  end

  def accept!
    flash[:success] = 'Order accepted!' if Order.find(params[:id]).update(accepted: true)
    redirect_to admin_orders_url
  end
end
