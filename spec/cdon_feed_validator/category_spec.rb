require 'spec_helper'

RSpec.describe CDONFeedValidator::Category do
  let(:instance) { described_class.new xml }

  let(:xml) do
    <<~XML.strip_heredoc
      <cables_network_cables>
        <network_cable_category>network_cable_category_cat6a</network_cable_category>
      </cables_network_cables>
    XML
  end

  subject { instance }

  its(:valid?) { is_expected.to be_truthy }

  context 'invalid xml' do
    let(:xml) do
      <<~XML.strip_heredoc
        <hello>
          <network_cable_category>network_cable_category_cat6a</network_cable_category>
        </hello>
      XML
    end

    its(:valid?) { is_expected.to be_falsey }
  end
end
