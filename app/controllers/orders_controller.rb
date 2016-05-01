class OrdersController < ApplicationController

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    total_tax = product.tax * quantity
    subtotal = product.price * quantity
    total = total_tax + subtotal

    order = Order.new(product_id: product.id, user_id: current_user.id, quantity: quantity, tax: total_tax, subtotal: subtotal, total: total)
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end

