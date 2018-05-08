class Api::V1::ItemsController < Api::V1::ApiController
  def index
    @items = Item.all
    render json: @items
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :id, :price, :description, :menu_id)
    end
  end
