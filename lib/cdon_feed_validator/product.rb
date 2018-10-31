require_relative './validator'

module CDONFeedValidator
  class Product < Validator
    private

      def filename
        'product.xsd'
      end
  end
end
