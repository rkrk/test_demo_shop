require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_register_confirm" do
    mail = NoticeMailer.sendmail_register_confirm
    assert_equal "Sendmail register confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
