class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image_id])

    if @product.save
      redirect_to @product, notice: 'Product created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product = Product.find(params[:id])
    @product.image.attach(params[:product][:image_id])

    product_params.delete(:image) if params[:product][:image].blank?

    if @product.update(product_params)
      redirect_to @product, notice: 'Product updated.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path, status: :see_other
  end


  private
    def product_params
      params.require(:product).permit(:name, :description, :value, :quantities, :category_id, :image_id)
    end
end
