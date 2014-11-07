Crud::App.controllers  do
  
  get :index, :map => '/' do
    'Hello World'
  end

  post :create, :map => '/' do
    Friend.create name: params['name']
  end
end
