describe Spree::Stock::Quantifier, type: :model do
  let(:target_stock_location) { nil }
  let!(:stock_location) { create :stock_location_with_items  }
  let!(:stock_item) { stock_location.stock_items.order(:id).first }

  before do
    stock_item.variant.update!(purchasable: false)
  end

  subject { described_class.new(stock_item.variant, target_stock_location).can_supply?(10) }

  it { is_expected.to be false }
end
