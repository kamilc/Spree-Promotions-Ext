module PromotionsHelper
  # returns the price of the product to show for display purposes
  def product_price_with_promotion(product, options={})
    options.assert_valid_keys(:format_as_currency, :show_vat_text)
    options.reverse_merge! :format_as_currency => true, :show_vat_text => Spree::Config[:show_price_inc_vat]

    amount = product.price_with_promotion(current_order(true))
    amount += Calculator::Vat.calculate_tax_on(product) if Spree::Config[:show_price_inc_vat]
    options.delete(:format_as_currency) ? format_price(amount, options) : amount
  end
end