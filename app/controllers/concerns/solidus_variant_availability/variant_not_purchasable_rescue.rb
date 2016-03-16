module SolidusVariantAvailability
  module VariantNotPurchasableRescue
    extend ActiveSupport::Concern

    included do
      rescue_from Spree::Variant::NotPurchasable, with: :variant_not_purchasable_error
    end
  end
end
