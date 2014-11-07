require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class FriendTest < MiniTest::Test
  def test_can_have_a_name
    friend = Friend.new name: 'Bob'
    assert_equal 'Bob', friend.name
  end
end