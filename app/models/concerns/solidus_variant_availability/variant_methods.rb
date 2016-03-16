module SolidusVariantAvailability
  module VariantMethods
    extend ActiveSupport::Concern

    class ::Spree::Variant::NotPurchasable < StandardError; end

    def self.in_stock(stock_locations = nil)
      super.where(purchasable: true)
    end

    def self.active(currency = nil)
      super.where(purchasable: true)
    end

    def in_stock?
      return false unless purchasable?

      Rails.cache.fetch(in_stock_cache_key) do
        total_on_hand > 0
      end
    end
  end
end
