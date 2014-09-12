namespace :algolia do
  task sync_products: :environment do
    products = Spree::Product.where 'synced_to_algolia_at is null OR synced_to_algolia_at < updated_at'
    products.find_each do |product|
      puts "Algolia sync for #{product.slug}"
      product.sync_with_algolia
    end
  end
end
