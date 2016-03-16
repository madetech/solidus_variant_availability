module SolidusVariantAvailability
  module StockQuantifierMethods
    extend ActiveSupport::Concern

    def can_supply?(required)
      return false unless @variant.purchasable?

      super
    end
  end
end
