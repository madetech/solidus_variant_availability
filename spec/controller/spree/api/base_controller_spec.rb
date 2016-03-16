class FakesController < Spree::Api::BaseController
end

describe Spree::Api::BaseController, type: :controller, tag: :api do
  render_views

  controller(Spree::Api::BaseController) do
    rescue_from Spree::Variant::NotPurchasable, with: :variant_not_purchasable_error

    def index
      render text: { 'products' => [] }.to_json
    end
  end

  before do
    @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
      r.draw { get 'index', to: 'spree/api/base#index' }
    end
  end

  context 'Not Purchasable Variant' do
    before do
      expect(subject).to receive(:authenticate_user).and_return(true)
      expect(subject).to receive(:index).and_raise(Spree::Variant::NotPurchasable)
      get :index, token: 'fake_key'
    end

    it 'will return a 422 status' do
      expect(response.status).to eq(422)
    end

    it 'returns an error message' do
      expect(json_response).to eq(
        { 'errors' => ['Variant is not purchasable at this time'], 'type' => 'not_purchasable' }
      )
    end
  end
end
