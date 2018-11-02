require_relative './validator'

class CDONFeedValidator::Category < CDONFeedValidator::Validator
  private

    def filename
      'categories.xsd'
    end
end
