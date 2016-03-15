class AddPurchasableToSpreeVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :purchasable, :boolean, default: :true, index: true
  end
end
