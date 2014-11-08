Crud::App.controllers  do
  before :show, :edit, :update, :destroy do
    id = params['id']
    @friend = Friend[id]
  end
  
  get :index, :map => '/' do
    'Hello World'
  end

  get :new, :map => '/new' do
    # routes can use any method to build a sting but is often best in a view template.
    form_tag '/' do
      text_field_tag(:name) + (submit_tag)
    end
  end

  post :create, :map => '/' do
    Friend.create name: params['name']
  end

  get :show, :map => '/:id' do
    @friend.name
  end

  get :edit, :map => '/:id/edit' do
    form_tag "/#{@friend.id}", method: 'put' do
      text_field_tag(:name, value: @friend.name) + (submit_tag)
    end
  end

  put :update, :map => '/:id' do
    @friend.update name: params['name']
  end

  delete :destroy, :map => '/:id' do
    @friend.destroy
  end
end
