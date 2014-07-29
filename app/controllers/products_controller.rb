class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
   params.permit!
    @product = Product.new(params[:product])

    if @product.save
      redirect_to @product
    else
      render 'new'
  end
end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
       render 'edit'
     end
  end

  def destroy
    
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to  products_path
   # @product.destroy
    #respond_to do |format|
     # format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
   def product_params
          params.require(:product).permit(:title, :description,:image_url,:price)
        end
end
