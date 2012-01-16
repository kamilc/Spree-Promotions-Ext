Product.class_eval do

  # Bool
  def has_price_promotion?
    !self.current_create_adjustment_action.nil?
  end

  # Order -> Double
  def price_with_promotion(order)
    if self.current_create_adjustment_action.nil?
      self.price
    else
      self.price + (self.current_create_adjustment_action.calculator.preferred_amount.to_f.abs * -1)
    end
  end

  # CreateAdjustment | nil
  def current_create_adjustment_action
    self.possible_promotions.each do |promo|
      actions = promo.promotion_actions.select { |a| a.type == "Promotion::Actions::CreateAdjustment" && a.calculator.type = "Calculator::FlatRate" }
      return actions.first if actions.count > 0
    end
    return nil
  end

end