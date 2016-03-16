module SolidusVariantAvailability
  module ApiBaseControllerMethods
    extend ActiveSupport::Concern

    private

    def variant_not_purchasable_error(exception)
      logger.error "variant_not_purchasable_error #{exception.inspect}"

      render(
        json: {
          errors: [I18n.t(:variant_not_purchasable_error, scope: 'spree')],
          type: 'not_purchasable',
        },
        status: 422
      )
    end
  end
end
