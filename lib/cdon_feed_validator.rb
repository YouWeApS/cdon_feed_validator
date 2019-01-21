$LOAD_PATH << File.expand_path('cdon_feed_validator', __dir__)

module CDONFeedValidator
  Error = Class.new StandardError

  autoload :Validator, 'validator'
  autoload :Product, 'product'
  autoload :Category, 'category'
end
