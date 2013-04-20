require 'test_helper'

class ConfigurationTest < MiniTest::Unit::TestCase
  def setup
    howell_config
  end

  def test_hostname
    assert_equal Howell.options.hostname, 'example.com'
  end

  def test_endpoint
    assert_equal Howell.options.endpoint, 'app_notices'
  end

  def test_params
    assert_equal Howell.options.params, '?channel=zaphyous'
  end

  def test_port
    assert_equal Howell.options.port, 1234
  end
end
