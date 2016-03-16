module SolidusVariantAvailability
  module OrderControllerMethods
    extend ActiveSupport::Concern

    private

    def variant_not_purchasable_error(_exception)
      flash[:error] = Spree.t(:variant_not_purchasable_error)
      redirect_back_or_default(spree.root_path)
    end
  end
end
