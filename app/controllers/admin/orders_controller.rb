class Admin::OrdersController < AdminBaseController
  def index
    @orders = Order.where(status: 'waiting')
  end

  def destroy
    flash[:danger] = 'Order rejected!' if Order.find(params[:id]).destroy
    redirect_to admin_orders_url
  end

  def change_status!
    order = Order.find(params[:id])
    order.status = params[:status]
    if order.valid? && params[:status]
      flash[:success] = "Order #{params[:status]}!" if order.save
    else
      flash[:warning] = 'Status unknown!'
    end
    redirect_to admin_orders_url
  end
end
