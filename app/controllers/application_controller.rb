class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    # set :default_content_type, 'application/json'
    # get all bakeries from the database
    bakeries = Bakery.all
    # send back all the bakeries as JSON
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end


  # returns an array of baked goods as JSON, sorted by price in descending order (FAILED - 1)
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
    # baked_goods = BakedGood.by_price
    # baked_goods.to_json
  end

  # returns the single most expensive baked good as JSON (HINT: how can you sort the baked goods in a particular order?) (FAILED - 1)
  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
  end
end
