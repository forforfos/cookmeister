require 'logger'
require 'elasticsearch'

settings = YAML::load(ERB.new(Rails.root.join('config').join('elasticsearch.yml').read).result)[Rails.env]

Rails.logger.info 'Connecting to ElasticSearch...'

begin
  Elasticsearch::Model.client = Elasticsearch::Client.new(
    cloud_id: settings['cloud_id'],
    user: settings['user'],
    password: settings['password']
  )

  Rails.logger.info "[#{Time.now.strftime('%d/%m/%Y %H:%M:%S')}] Successfully connected to Elasticsearch!"
rescue => error
  Rails.logger.error "[#{Time.now.strftime('%d/%m/%Y %H:%M:%S')}] Failed to connect to ElasticSearch with error: #{error}"
end



