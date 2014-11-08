require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ControllersTest < MiniTest::Test
  def setup
    app Crud::App do
      set :protect_from_csrf, false
    end
  end

  def test_home_page_returns_ok
    get '/'
    assert last_response.ok?, 'Homepage should respond ok'
  end

  def test_new_page_returns_ok
    get '/new'
    assert last_response.ok?, 'New friend page should be available'
  end

  def test_test_can_create_friend
    post '/', name: 'Keith'
    friend = Friend.last
    assert_equal 'Keith', friend.name
  end
end