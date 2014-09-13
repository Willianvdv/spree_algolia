namespace :algolia do
  task index_products: :environment do
    Spree::Product.find_each do |product|
      puts "Indexing #{product.slug}"
      product.index!
    end
  end
end
