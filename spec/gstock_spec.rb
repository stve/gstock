require 'spec_helper'

describe Gstock do

  it 'should return data for valid symbols' do
    quote = Gstock.quote('YHOO')
    quote.should be_kind_of(Hashie::Mash)
  end

  it 'should not return empty data values' do
    quote = Gstock.quote('YHOO')
    quote.values.each do |value|
      value.should_not be_nil
    end
  end

  it 'should raise an error when a symbol isn\'t found' do
    lambda do
      Gstock.quote('123ABC')
    end.should raise_error Gstock::NotFound
  end

end