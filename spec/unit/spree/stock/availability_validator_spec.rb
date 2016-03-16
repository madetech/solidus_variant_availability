describe Spree::Stock::AvailabilityValidator, type: :model do
  let(:variant) { create(:variant, :with_stock) }

  let!(:line_item) { create(:line_item, variant: variant) }

  subject { described_class.new.validate(line_item) }

  it { is_expected.to be true }

  context 'when variant is not purchasable' do
    let(:variant) { create(:variant, :with_stock, :not_purchasable) }

    it { is_expected.to be false }
  end
end
