module Spree
  module Core
    module Search
      class Algolia < Base

        private
          def get_products_conditions_for(base_scope, query)
            return base_scope if query.blank?

            Rails.logger.info { "Searching Algolia for: #{query}" }
            results = algolia_index.search(query, attributesToRetrieve=['objectID'])
            object_ids = results['hits'].map { |obj| obj['objectID'] }
            Rails.logger.debug { "Algolia match for #{query}: #{object_ids}" }

            # Prevent a sql injection via algolia
            objects_ids_as_string = ActiveRecord::Base::sanitize object_ids.join(',')

            base_scope
              .where(id: object_ids)
              .order("position(spree_products.id::text in #{objects_ids_as_string})")
          end

          def algolia_index
            ::Algolia::Index.new algolia_index_name
          end

          def algolia_index_name
            Spree::Config.site_name
          end
      end
    end
  end
end
