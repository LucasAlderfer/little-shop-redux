require 'will_paginate'
require 'will_paginate/active_record'

class LittleShopApp < Sinatra::Base
  configure do
    register WillPaginate::Sinatra
  end

  get '/merchants' do
    @merchants = Merchant.paginate(:page => params[:page], :per_page => 30)
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    current_day = Time.now.strftime("%Y-%m-%d")
    Merchant.create(
                      id: Merchant.last.id + 1,
                      name: params[:merchant][:name],
                      created_at: current_day,
                      updated_at: current_day
                    )
    redirect "/merchants/#{Merchant.last.id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.where(id: params[:id]).includes(:items).first
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
    @items = Item.paginate(:page => params[:page], :per_page => 40)
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'items/new'
  end

  post '/items' do
    current_day = Time.now.strftime("%Y-%m-%d")

    item_id = Item.generate_id

    Item.create(
                  id: item_id,
                  name: params[:item][:name],
                  description: params[:item][:description],
                  unit_price: params[:item][:description],
                  image_url: params[:item][:image_url],
                  merchant_id: params[:item][:merchant_id],
                  created_at: current_day,
                  updated_at: current_day
                )

    redirect "/items/#{item_id}"
  end

  get '/items/:id' do
    @item = Item.where(id: params[:id]).includes(:merchant).first
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    erb :'items/edit'
  end

  put '/items/:id' do
    params[:item][:merchant_id] = params[:item][:merchant_id].to_i
    params[:item][:unit_price] = params[:item][:unit_price].to_i
    Item.update(params[:id].to_i, params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.where(id: params[:id]).destroy_all
    redirect '/items'
  end

  get '/invoices' do
    @invoices = Invoice.paginate(:page => params[:page], :per_page => 100)
    erb :'invoices/index'
  end

  get '/invoices/:id' do
    @invoice = Invoice.where(id: params[:id]).includes(:merchant, :invoice_items, :items).first
    @merchant = @invoice.merchant
    @invoice_items = @invoice.invoice_items
    erb :'invoices/show'
  end

  delete '/invoices/:id' do
    Invoice.where(id: params[:id]).destroy_all
    redirect '/invoices'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.where(id: params[:id]).includes(:merchant, :invoice_items, :items).first
    @merchant = @invoice.merchant
    @invoice_items = @invoice.invoice_items
    erb :'invoices/edit'
  end

  put '/invoices/:id/edit' do
    Invoice.update(params[:id].to_i, params[:invoice])
    redirect "/invoices/#{params[:id]}"
  end
end
