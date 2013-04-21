require 'test_helper'

class ConfigurationTest < MiniTest::Unit::TestCase
  def setup
    Howell::Rails.configure(
      environment: 'production',
      project_root: File.expand_path(File.dirname(__FILE__) + '../../../'),
    )
  end

  def test_environment
    assert_equal Howell::Rails..options.environment, 'production'
  end

  def test_project_root
    assert_equal Howell::Rails.options.project_root, File.expand_path(File.dirname(__FILE__) + '../../..')
  end
end
