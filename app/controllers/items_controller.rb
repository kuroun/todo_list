class ItemsController < ApplicationController
  before_action :set_item, :check_authorized_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @items = Item.all_items(current_user.id)
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    respond_with(@item, :location => list_path(session[:list_id]))
  end

  def update
    @item.update(item_params)
    respond_with(@item, :location => list_path(session[:list_id]))
  end

  def destroy
    @item.destroy
    respond_with(@item, :location => list_path(session[:list_id]))
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :state, :note, :list_id)
    end
    def check_authorized_user
      if(@item.list.user_id != current_user.id)
        redirect_to lists_path
      end
    end
end
