require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative('./models/pizza_order')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

#READ - all/index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#CREATE
get '/pizza-orders/new' do
  erb(:new)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#READ - one/show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

#UPDATE
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.update
  redirect "/pizza-orders/#{@order.id}"
end


#DELETE
post '/pizza-orders/order-deleted/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:destroy)
end

get '/pizza-orders/order-deleted/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:destroy)
end

# REST - representational state transfer
