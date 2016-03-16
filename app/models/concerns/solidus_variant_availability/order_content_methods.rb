module SolidusVariantAvailability
  module OrderContentMethods
    extend ActiveSupport::Concern

    def add(variant, quantity = 1, options = {})
      raise Spree::Variant::NotPurchasable unless variant.purchasable?

      super
    end
  end
end
