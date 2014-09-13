Spree::Product.class_eval do
  include AlgoliaSearch

  algoliasearch index_name: Spree::Config.site_name do
    attribute :name, :slug, :description
  end
end
