class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new

  end

  def create
    new_product = Product.new(name: params[:name], price: params[:price], image_url: params[:image_url])
    new_product.save
    flash[:success] = "Product Created"
    redirect_to "/products/#{new_product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])

  end

  def update

    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.save
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"

  def destroy

  end

  def create
    new_product = Product.new

  end


    
    
    # second way
    # @product = Product.find_by(id: params[:id])
    # @product.assign.attributes(model: params[:model], price: params[:price], image: params[:image])
      # @product.save

   # third way
   # @product = Product.find_by(id: params[:id])
   # @product.update(model: params[:model], price: params[:price], image: params[:image])


  end

end
