# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

settings = YAML::load(ERB.new(Rails.root.join('config').join('frontend.yml').read).result)[Rails.env]

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "#{settings['url']}"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
