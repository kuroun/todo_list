class ListsController < ApplicationController
  before_action :set_list,:check_authorized_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lists = List.where(user_id: current_user.id).order('created_at DESC')
    respond_with(@lists)
  end

  def show
    respond_with(@list)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.save
    respond_with(@list)
  end

  def update
    @list.update(list_params)
    respond_with(@list)
  end

  def destroy
    @list.destroy
    respond_with(@list)
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :description, :user_id)
    end

    def check_authorized_user
      if(@list.user_id != current_user.id)
        redirect_to lists_path
      end
    end
end
