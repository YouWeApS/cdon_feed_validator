require 'spec_helper'

RSpec.describe CDONFeedValidator::Product do
  let(:options) { { a: :b } }
  let(:instance) { described_class.new xml, **options }

  let(:xml) do
    <<~XML.strip_heredoc
      <?xml version="1.0" encoding="UTF-8"?>
      <marketplace xmlns="https://schemas.cdon.com/product/4.0/4.1.0/product">
        <product>
        <identity>
          <id>100</id>
        </identity>
        <title>
          <default>Twisted Cat</default>
        </title>
        <description>
          <default>Ethernet with a twist!</default>
        </description>
        <category>
          <cables_network_cables>
            <network_cable_category>network_cable_category_cat6a</network_cable_category>
          </cables_network_cables>
        </category>
        <usp>
          <value>
            <default>Six alpha cats</default>
            <se>Sex alphakatter</se>
          </value>
          <value>
            <default>Lasts long</default>
            <se>Räcker länge</se>
          </value>
        </usp>
        <energy>
          <class>APlusPlus</class>
          <label>https://cdon.com/label.jpg</label>
          <arrow>https://cdon.com/arrow.png</arrow>
          <sheet>https://cdon.com/sheet.pdf</sheet>
        </energy>
        <dimensions>
          <length>
            <value>5</value>
            <unit>m</unit>
          </length>
        </dimensions>
        <releaseDate>1987-01-01</releaseDate>
        </product>
      </marketplace>
    XML
  end

  subject { instance }

  its(:xml) { is_expected.to be_a Nokogiri::XML::Document }
  its(:options) { is_expected.to eql options.as_json }
  its(:errors) { is_expected.to be_empty }

  describe '#valid?' do
    subject { instance.valid? }

    it { is_expected.to be_truthy }

    context 'invalid xml' do
      let(:xml) do
        <<~XML.strip_heredoc
          <product>
          </product>
        XML
      end

      it { is_expected.to be_falsey }
    end
  end

  describe '#validate' do
    subject { instance.validate }

    it { is_expected.to be_empty }

    context 'invalid xml' do
      let(:xml) do
        <<~XML.strip_heredoc
          <product>
          </product>
        XML
      end

      it { is_expected.not_to be_empty }
    end
  end
end
