class Admin::OrdersController < AdminBaseController
  def index
    @orders = Order.all
  end

  def destroy
    flash[:danger] = 'Order rejected!' if Order.find(params[:id]).destroy
    redirect_to admin_orders_url
  end

  def change_status!
    order = Order.find(params[:id])
    order.status = params[:status]
    if order.valid?
      flash[:success] = "Order #{params[:status]}ed!" if order.save
    else
      flash[:warning] = 'Status unknown!'
    end
    redirect_to admin_orders_url
  end
end
