require 'spec_helper'

describe CarrierServices do
  it 'should return correct version string' do
    CarrierServices::VERSION == "0.0.1"
  end
end
