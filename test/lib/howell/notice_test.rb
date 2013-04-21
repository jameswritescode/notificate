require 'test_helper'

class NoticeTest < MiniTest::Unit::TestCase
  def setup
    howell_config

    @stub_notice = stub_request(:post, Howell.request_path)
  end

  def test_notices_going_to_endpoint
    Howell.notice 'Testing'

    assert_requested @stub_notice
  end
end
