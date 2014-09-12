class AddsSyncedToAlgoliaAt < ActiveRecord::Migration
  def change
    add_column :spree_products, :synced_to_algolia_at, :datetime
  end
end
