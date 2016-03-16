module SolidusVariantAvailability
  module VariantMethods
    extend ActiveSupport::Concern

    class ::Spree::Variant::NotPurchasable < StandardError; end

    module ClassMethods
      def in_stock(stock_locations = nil)
        super.where(purchasable: true)
      end

      def active(currency = nil)
        super.where(purchasable: true)
      end
    end

    def self.prepended(base)
      class << base
        prepend ClassMethods
      end
    end

    def in_stock?
      return false unless purchasable?

      Rails.cache.fetch(in_stock_cache_key) do
        total_on_hand > 0
      end
    end
  end
end
