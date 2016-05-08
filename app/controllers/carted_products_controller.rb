class CartedProductsController < ApplicationController

  # validates :name, :price, :description, presence: true

  def index
    @order = current_user.orders.find_by(completed: false)
    @carted_products = @order.carted_products
  end

  def create

    order = (current_user.orders.find_by(completed: false) || Order.create(completed: false, user_id: current_user.id))

    carted_product = CartedProduct.new(product_id: params[:product_id], order_id: order.id, quantity: params[:quantity])
    carted_product.save
    session[:cart_count] = nil
    redirect_to "/carted_products"
  end
  

  def show
    if params[:id] =="random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    # @carted_products = CartedProduct.find_by(id: params[:id])
  end

  

  def destroy
    Carted_product.find_by(id: params[:id].destroy)
        session[:cart_count] = nil
    redirect_to "/carted_products/destroy"
  end


end
