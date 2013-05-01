require 'test_helper'

# TODO:
# * Add a test to check the content of what is being sent in a notice
class NotificateNoticeTest < MiniTest::Unit::TestCase
  def setup
    notificate_config

    @stub_notice = stub_request(:post, Notificate.request_path)
  end

  def test_notices_going_to_endpoint
    Notificate.notice 'Testing'

    assert_requested @stub_notice
  end
end
