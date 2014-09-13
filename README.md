# Spree Algolia

Work in progress.

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

## Stuff

<3 Pull requests
