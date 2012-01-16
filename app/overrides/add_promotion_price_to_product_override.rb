Deface::Override.new(:virtual_path => "shared/_products",
                    :name => "add_promotion_price_to_product_override",
                    :replace => "span.price.selling",
                    :partial => "shared/product_price_with_promotion",
                    :disabled => false)