require 'elasticsearch/extensions/test/cluster'
require 'cookmeister/elasticsearch/index'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Start an in-memory cluster for Elasticsearch as needed
  config.before :suite do
    # Elasticsearch::Extensions::Test::Cluster.start(port: 9250, number_of_nodes: 1, timeout: 120)

    Cookmeister::ElasticSearch::Index.create_index(false, true)
  end

  # Stop elasticsearch cluster after test run
  config.after :suite do
    Ingredient.delete_all
    # if Elasticsearch::Extensions::Test::Cluster.running?(on: 9250, number_of_nodes: 1)
    #   Elasticsearch::Extensions::Test::Cluster.stop(port: 9250, number_of_nodes: 1)
    # end
  end
end
