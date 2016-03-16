module SolidusVariantAvailability
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_variant_availability'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::Variant.prepend(SolidusVariantAvailability::VariantMethods)
      Spree::OrderContents.prepend(SolidusVariantAvailability::OrderContentMethods)
      Spree::Stock::Quantifier.prepend(SolidusVariantAvailability::StockQuantifierMethods)

      Spree::OrdersController.include(SolidusVariantAvailability::VariantNotPurchasableRescue)
      Spree::OrdersController.include(SolidusVariantAvailability::OrderControllerMethods)

      Spree::Api::BaseController.include(SolidusVariantAvailability::ApiBaseControllerMethods)
      Spree::Api::ReturnAuthorizationsController.include(SolidusVariantAvailability::VariantNotPurchasableRescue)
      Spree::Api::CheckoutsController.include(SolidusVariantAvailability::VariantNotPurchasableRescue)
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
