class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect "/merchants/#{params[:merchant][:id]}"
  end
  
  get '/merchants/:id' do
    @merchant = Merchant.find_by_id(params[:id])
    erb :'merchants/show'
  end

  #
  # get '/merchants/:id/edit' do
  #   @merchant = Merchant.find(params[:id])
  #   erb :'merchants/edit'
  # end
  #
  # put '/merchants/:id' do
  #   Merchant.update(id.to_i, params[:merchant])
  #   redirect "/merchants/#{params[:id]}"
  # end
  #
  # delete '/merchants/:id' do
  #   Merchant.destroy(params[:id])
  #   redirect '/merchants'
  # end
end
