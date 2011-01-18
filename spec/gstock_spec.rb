require 'spec_helper'

describe GStock do

  it 'should return data for valid symbols' do
    quote = GStock.quote('YHOO')
    quote.should be_kind_of(Hashie::Mash)
  end

  it 'should not return empty data values' do
    quote = GStock.quote('YHOO')
    quote.values.each do |value|
      value.should_not be_nil
    end
  end

  it 'should raise an error when a symbol isn\'t found' do
    lambda do
      GStock.quote('123ABC')
    end.should raise_error GStock::NotFound
  end

end