class CartedProductsController < ApplicationController

  def create

    order = (current_user.orders.find_by(completed: false) || Order.create(completed: false, user_id: current_user.id))
  else
    order = Order.new(completed: false, user_id: current_user.id)
    order.save
  end

  carted_product = CartedProduct.new(product_id: params[:product_id], order_id: params[:order_id], quantity: params[:quantity])
  carted_product.save
  redirect_to "/carted_products"
  

  def show
    # @carted_products = CartedProduct.find_by(id: params[:id])
    end

  def index
    order = current_user.orders.find_by(completed: false)
    @carted_products = order.carted_products
  end

  def destroy
    Carted_product.find_by(id: params[:id].destroy)
    redirect_to "/carted_products/destroy"
  end


end
