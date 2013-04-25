require 'test_helper'

# TODO:
# * Add a test to check the content of what is being sent in a notice
class HowellNoticeTest < MiniTest::Unit::TestCase
  def setup
    howell_config

    @stub_notice = stub_request(:post, Howell.request_path)
  end

  def test_notices_going_to_endpoint
    Howell.notice 'Testing'

    assert_requested @stub_notice
  end
end
