require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'

  add_group "Entities", "lib/mkm/entity"
  add_group "Services", "lib/mkm/service"
  add_filter "/.rvm/"
  add_filter "/.rbenv/"
  add_filter "/.gems/"
end
SimpleCov.minimum_coverage 97
SimpleCov.start if ENV["COVERAGE"] or ARGV.last == 'spec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'mkm'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{ File.dirname __FILE__ }/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  include Samples
end
