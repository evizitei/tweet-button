require 'helper'
require 'cgi'

class TestTweetButton < Test::Unit::TestCase
  def setup
    @tweeter = TweetMocker.new
  end
  
  def test_normal_custom_tweet_button
    assert @tweeter.custom_tweet_button =~ /http:/
  end
  
  def test_secure_custom_tweet_button
    assert @tweeter.custom_tweet_button("tweet",:ssl=>true) =~ /https:/
  end
end

class TweetMocker
  include TweetButton
  
  def request
    self
  end
  
  def url
    ""
  end
  
  def link_to(text,url,options)
    "<a href='#{url}'>#{text}</a>"
  end
end