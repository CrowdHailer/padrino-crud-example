Crud::App.controllers  do
  before :show, :edit, :update, :destroy do
    id = params['id']
    @friend = Friend[id]
  end
  
  get :index, :map => '/' do
    @friends = Friend.all
    render :index
  end

  get :new, :map => '/new' do
    render :new
  end

  post :create, :map => '/' do
    Friend.create name: params['name']
  end

  get :show, :map => '/:id' do
    render :show
  end

  get :edit, :map => '/:id/edit' do
    render :edit
  end

  put :update, :map => '/:id' do
    @friend.update name: params['name']
  end

  delete :destroy, :map => '/:id' do
    @friend.destroy
  end
end
