class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    current_day = Time.now.strftime("%Y-%m-%d")
    Merchant.create(id: Merchant.last.id + 1, name: params[:merchant][:name], created_at: current_day, updated_at: current_day)
    redirect "/merchants/#{Merchant.last.id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find_by_id(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do
    Merchant.update(params[:id].to_i, params[:merchant])
    redirect "/merchants/#{params[:id]}"
  end

  delete '/merchants/:id' do
    Merchant.where(id: params[:id]).destroy_all
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    current_day = Time.now.strftime("%Y-%m-%d")
    Item.create(id: Item.last.id + 1, name: params[:item][:name], description: params[:item][:description], unit_price: params[:item][:description], image_url: params[:item][:image_url], merchant_id: params[:item][:merchant_id], created_at: current_day, updated_at: current_day)
    redirect "/merchants/#{Item.last.id}"
  end

  get '/items/:id' do
    @item = Item.where(id: params[:id]).includes(:merchant).first
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find_by_id(params[:id])
    erb :'items/edit'
  end

  put '/items/:id' do
    Item.update(params[:id].to_i, params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.where(id: params[:id]).destroy_all
    redirect '/items'
  end
end
