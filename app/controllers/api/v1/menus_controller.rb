module Api::V1

  class MenusController < ApiController
    before_action :authenticate_user
    def index
      @menus = Menu.all
      render json: @menus
    end

    def show
      @menu = Menu.find(params[:id])
      render json: @menu
    end

    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        render json: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    def update
      @menu = Menu.find(params[:id])
      if @menu.update(menu_params)
        render json: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
    end

    private

    def menu_params
      params.require(:menu).permit([:heading])
    end
  end

end
