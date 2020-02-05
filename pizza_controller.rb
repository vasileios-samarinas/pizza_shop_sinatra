require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative('./models/pizza_order')
also_reload('./models/*')

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

#DELETE

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  erb(:destroy)
end

# REST - representational state transfer
