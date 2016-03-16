describe Spree::OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:variant) { create(:variant, :with_stock) }
  let(:store) { create(:store) }

  let!(:order) { Spree::Order.create!(store: store) }

  before do
    allow(controller).to receive_messages(try_spree_current_user: user)
    request.env['HTTP_REFERER'] = spree.root_path
  end

  it 'in stock and purchasable variants should populate an order' do
    spree_post(:populate, variant_id: variant.id, quantity: 1)

    expect(user.orders.last.line_items.count).to_not be_zero
  end

  context 'when variant is not purchasable' do
    let(:variant) { create(:variant, :with_stock, :not_purchasable) }

    it 'it will not populate an order' do
      spree_post(:populate, variant_id: variant.id, quantity: 1)

      expect(user.orders.last.line_items.count).to be_zero
      expect(response).to redirect_to(spree.root_path)
    end
  end
end
