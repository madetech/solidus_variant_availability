describe Spree::Variant do
  let(:variant) { create(:variant, :with_stock) }

  subject { variant }

  it { is_expected.to be_purchasable }
  it { is_expected.to be_in_stock }

  context 'when a varaint is not purchasable' do
    let(:variant) { create(:variant, :with_stock, :not_purchasable) }

    it { is_expected.to_not be_purchasable }
    it { is_expected.to_not be_in_stock }
  end
end
