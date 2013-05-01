require 'test_helper'

class NotificateConfigurationTest < MiniTest::Unit::TestCase
  def setup
    notificate_config
  end

  def test_hostname
    assert_equal Notificate.options.hostname, 'example.com'
  end

  def test_endpoint
    assert_equal Notificate.options.endpoint, 'app_notices'
  end

  def test_params
    assert_equal Notificate.options.params, '?channel=zaphyous'
  end

  def test_port
    assert_equal Notificate.options.port, 1234
  end

  def test_request_path
    assert_equal Notificate.request_path, 'http://example.com:1234/app_notices?channel=zaphyous'
  end
end
