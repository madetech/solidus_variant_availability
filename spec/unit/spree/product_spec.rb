describe Spree::Product do
  let!(:product) { create(:product_with_option_types) }

  before do
    option_values = create_list(:option_value, 2, option_type: product.option_types.first)

    option_values.each do |option_value|
      create(:variant, :with_stock, option_values: [option_value], product: product)
    end

    product.reload
  end

  context '#variants_and_option_values' do
    subject { product.variants_and_option_values.count }

    it { is_expected.to eq(2) }

    context 'when one variant is not purchasable' do
      before do
        product.variants.first.update_attributes(purchasable: false)
        product.reload
      end

      it { is_expected.to eq(1) }
    end
  end
end
