require "grape-swagger-rails/engine"

module GrapeSwaggerRails
  class Options < OpenStruct
    def before_filter(&block)
      if block_given?
        self.before_filter_proc = block
      else
        self.before_filter_proc
      end
    end
  end

  mattr_accessor :options

  self.options = Options.new(

    url:                  '/swagger_doc.json',
    app_name:             'Swagger',
    app_url:              'http://swagger.wordnik.com',

    headers:              {},

    api_auth:             '',        # 'basic' or 'bearer' or 'custom'
    api_key_name:         'api_key', # 'Authorization'
    api_key_type:         'query',   # 'header'
    api_key_prefix:       '',        # 'Token user_token='

    before_filter_proc:   nil # Proc used as a controller before filter
  )

end
