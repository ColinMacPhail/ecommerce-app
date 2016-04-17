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
    new_product = Product.new(name: params[:name], )
    new_product.save
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update

    @product = Product.find_by(id: params[:id])
    @product.model = params[:name]
    @product.price = params[:price]
    @product.image = params[:description]
    @product.save

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
