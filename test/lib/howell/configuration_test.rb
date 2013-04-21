require 'test_helper'

class HowellConfigurationTest < MiniTest::Unit::TestCase
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

  def test_request_path
    assert_equal Howell.request_path, 'http://example.com:1234/app_notices?channel=zaphyous'
  end
end
