class Admin::ProductsController < AdminBaseController
  def index
    @products = Product.all
    @form_product ||= Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    redirect_to admin_products_url
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :category, :image)
  end
end
