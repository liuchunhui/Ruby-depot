class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def  new
		@product = Product.new
	end

	def create
		params.permit!
		@product  = Product.new(product_params)

		@product.save
		redirect_to @product
	end
	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to @product
		else
			render  'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy
		redirect_to  products_path
	end

################################################################
	def who_bought
		@product = Product.find(params[:id])
		respond_to do |format|
			format.atom
			format.xml  { render :xml => @product}
		end
	end
################################################################
	private 
	def product_params
		params.require(:product).permit(:title,:description,:image_url,:price)
	end
end
