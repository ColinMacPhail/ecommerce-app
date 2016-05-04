class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :carted_products
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :order, through: :carted_products



  def friendly_created_at
    return created_at.strftime("%b %e, %l:%M %p")
  end

  def sales_message
    if price < 2000
      return "Discount item!"
    else
      return "On sale!"
    end
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    "#{tax} + #{price}"
  end


end
