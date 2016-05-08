class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    if params[:sort]
      @products = Product.order(:price)
    elsif params[:category]
      @products =  Category.find_by(id: params[:id]).products
    end

      else
      @products = Product.all
      end
    # sort_choice =params[:sort]
    # if sort_choice == "high_price"
    #   @products = Product.order(:price)
    # elsif sort_choice == "low_price"
    #   @products = Product.order(price: :desc)
    # else
    #   @products = Product.all

    
end

def show
  @product = Product.find_by(id: params[:id])
end

def new
  @product = Product.new

end

def create
  new_product = Product.new(name: params[:name], price: params[:price], description: params[:description])
  if @product.save #happy_path
    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  else #sad_path
    render :new
  end

end

def edit
  @product = Product.find_by(id: params[:id])

end

def update

  @product = Product.find_by(id: params[:id])
  @product.name = params[:name]
  @product.price = params[:price]
  @product.image = params[:image]
  @product.description = params[:description]
  @product.save
  flash[:success] = "Product Updated"
  redirect_to "/products/#{@product.id}"

  def destroy

  end

  def create
    new_product = Product.new

  end




  User.first.orders.find_by(completed: false).carted_products.first.product


    # second way
    # @product = Product.find_by(id: params[:id])
    # @product.assign.attributes(model: params[:model], price: params[:price], image: params[:image])
      # @product.save

   # third way
   # @product = Product.find_by(id: params[:id])
   # @product.update(model: params[:model], price: params[:price], image: params[:image])


 end


