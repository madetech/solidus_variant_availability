FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'solidus_variant_availability/factories'
end

FactoryGirl.modify do
  factory :base_variant do
    trait :not_purchasable do
      purchasable false
    end

    trait :with_stock do
      after(:create) do |variant|
        variant.stock_items << create(:stock_item)
      end
    end
  end
end
