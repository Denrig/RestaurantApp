class Admin::ProductsController < AdminBaseController
  def index
    @products = Product.all
  end

  def new
    @product ||= Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :category, :image)
  end
end
