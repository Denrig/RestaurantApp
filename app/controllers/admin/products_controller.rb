class Admin::ProductsController < AdminBaseController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product added!'
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:success] = 'Product updated!'
      redirect_to admin_products_url
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      flash[:success] = 'Product deleted!'
    else
      flash[:danger] = 'Errors appeard while trying to delete product'
    end
    redirect_to admin_products_url
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :category, :image)
  end
end
