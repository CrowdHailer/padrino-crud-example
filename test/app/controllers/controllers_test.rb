require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ControllersTest < MiniTest::Test
  def before
    app Crud::App do
      set :protect_from_csrf, false
    end
  end

  def test_home_page_returns_ok
    get '/'
    assert last_response.ok?, 'Homepage should respond ok'
  end
end