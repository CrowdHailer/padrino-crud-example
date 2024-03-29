require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ControllersTest < MiniTest::Test
  def setup
    app Crud::App do
      set :protect_from_csrf, false
    end
    # Keep test database Empty
    Friend.dataset.destroy
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

  def test_can_view_a_friend
    friend = Friend.create name: 'Neil'
    get "/#{friend.id}"
    assert last_response.ok?, 'Should be able to view a friend'
    assert_includes last_response.body, 'Neil'
  end

  def test_edit_page_shows_current_name
    friend = Friend.create name: 'Mike'
    get "/#{friend.id}/edit"
    assert last_response.ok?, 'Edit page should be available'
    assert_includes last_response.body, 'value="Mike"'
  end

  def test_update_action_changes_name
    friend = Friend.create name: 'Susan'
    put "/#{friend.id}", name: 'Sue'
    follow_redirect!
    assert last_response.ok?, 'Update action should be available'
    # Update action changes database entry.
    # We need to load latest version to ensure change has been made
    friend.reload
    assert_equal 'Sue', friend.name
  end

  def test_destroy_action_removes_friend
    friend = Friend.create name: 'Stan'
    delete "/#{friend.id}"
    follow_redirect!
    assert last_response.ok?, 'delete action should be available'
    assert_nil Friend[friend.id]
  end

  def test_redirects_if_friend_not_found
    get '/2'
    assert last_response.redirect?, 'Should redirect from non found friend page'
  end
end