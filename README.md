# Spree Algolia

With this gem you can use Algolia (https://www.algolia.com/) as search engine.

## Install

Add this gem to your Gemfile.

```
gem 'spree_algolia', github: 'Willianvdv/spree_algolia'
```

Now make an initializer to configure algolia:

```
# initializers/algolia.rb

Spree.config do |config|
  # Use this search implementation
  config.searcher_class = Spree::Core::Search::Algolia
end

AlgoliaSearch.configuration = { application_id: 'APPLICATION_KEY',
                                api_key: 'API_KEY' }
```

To add extra fields to an Algolia document do:

```
Spree::Product.class_eval do
  algoliasearch do
    add_attribute :fancy_field, :some_other_fancy_field
  end
end
```

To reindex all the products:

```
Spree::Product.reindex!
```

## Stuff

- I'm using Postgresql. I'm not sure the `position` query in the Algolia search class is going to work in other databases (https://github.com/Willianvdv/spree_algolia/blob/master/lib/spree/core/search/algolia.rb)
- Typeahead support would be awesome. https://www.algolia.com/doc/tutorials/auto-complete
- <3 Pull requests
