require 'simplecov'
SimpleCov.start do
  add_group 'GStock', 'lib/gstock'
  add_group 'Specs', 'spec'
end

require File.expand_path('../../lib/gstock', __FILE__)

require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.include WebMock::API
end
