require 'spec_helper'

describe CarrierServices::Mtn do
  it 'Should log you in' do
    msisdn = ENV['MSISDN']
    pin = ENV['PIN']
    balance = CarrierServices::Mtn.new().get_balance(msisdn, pin)
    puts balance.inspect

    #Stupid login form takes in number in 071 format but returns it in 2771
    balance[:msisdn].should == msisdn.to_s.gsub(/^0/,'27')
  end
end
