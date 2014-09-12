Spree::Product.class_eval do
  def sync_with_algolia
    index = Algolia::Index.new algolia_index_name
    index.add_object algolia_data, id
    touch(:synced_to_algolia_at)
  end

  private

  def algolia_index_name
    Spree::Config.site_name
  end

  def algolia_data
    custom_algolia_data({ name: name, slug: slug, description: description })
  end

  # Override this method to add your own fields
  def custom_algolia_data(algolia_data)
    algolia_data
  end
end
