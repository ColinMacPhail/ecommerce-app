class OrdersController < ApplicationController

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    total_tax = product.tax * quantity
    subtotal = product.price * quantity
    total = total_tax + subtotal

    new_order = Order.new( user_id: current_user.id, quantity: quantity, tax: total_tax, subtotal: subtotal, total: total, completed: false)
    new_order.save
    flash[:success] ="sold"

    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
        order = Order.find_by(id: params[:id])

        order.carted_products.each do |carted_product|
          total_tax += (carted_product.product.tax * carted_product.quantity)
          total_subtotal += (carted_product.product.price * carted_product.quantity)
  end
            
        total = total_tax * total_subtotal
        

  end
        order.update(completed: true, tax: )

  

end

