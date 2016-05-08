class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  # validate :quantity_must_be_less_than_10

  def quantity_must_be_less_than_10
    if quantity > 9
      errors.add(:quantity, "Hey, you can only get one more dude!")
    end
  end
end

