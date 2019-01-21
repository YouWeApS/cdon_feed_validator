require 'active_support/all'

$LOAD_PATH << File.expand_path('cdon_feed_validator', __dir__)

module CDONFeedValidator
  VERSION = '1.0.2'

  Error = Class.new StandardError

  autoload :Validator, 'validator'
  autoload :Product, 'product'
  autoload :Category, 'category'
end
