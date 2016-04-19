class Product < ActiveRecord::Base

  def friendly_created_at
    return created_at.strftime("%b %e, %l:%M %p")
  end

  def sales_message
    if price < 2
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
