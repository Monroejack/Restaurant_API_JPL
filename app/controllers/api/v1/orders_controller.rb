module Api::V1
  class OrdersController < ApiController
    before_action :authenticate_user
  def index
    @orders = Order.all
    render json: @orders
  end

  def create

    @order = Order.new(order_params)

    if @order.save
      @order.update(total: @order.items.sum(:price))
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end



  private

    def order_params
      params.require(:order).permit(:user_id, item_orders_attributes: [:item_id, :id])
    end
  end
end
