require 'nokogiri'

module CDONFeedValidator
  class Validator
    XSDDIR = File.expand_path('../xsd', __dir__)

    attr_reader :xml, :options, :errors

    def initialize(xml, **options)
      @xml = Nokogiri::XML xml
      @options = options.as_json
      @errors = []
    end

    def valid?
      validate
      errors.empty?
    end

    def validate
      @errors = file
        .validate(xml)
        .map(&:to_s) || []
    end

    private

      def filename
        raise NotImplementedError, 'must be implemented by descendents'
      end

      def file
        string = File.read File.expand_path filename, XSDDIR

        # Replace schema location references with ones pointing to local xsd
        # files
        string.gsub! \
          'schemaLocation="',
          "schemaLocation=\"#{XSDDIR}/"

        Nokogiri::XML::Schema string
      end
  end
end
