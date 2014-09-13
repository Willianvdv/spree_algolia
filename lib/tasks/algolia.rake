namespace :algolia do
  task index_products: :environment do
    Spree::Product.all.find_each do |product|
      puts "Algolia sync for #{product.slug}"
      product.index!
    end
  end
end
