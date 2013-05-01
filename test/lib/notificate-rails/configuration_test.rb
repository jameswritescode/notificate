require 'test_helper'

class NotificateRailsConfigurationTest < MiniTest::Unit::TestCase
  def setup
    Notificate::Rails.configure(
      environment: 'production',
      project_root: File.expand_path(File.dirname(__FILE__) + '../../../'),
    )
  end

  def test_environment
    assert_equal Notificate::Rails.options.environment, 'production'
  end

  def test_project_root
    assert_equal Notificate::Rails.options.project_root, File.expand_path(File.dirname(__FILE__) + '../../..')
  end
end
