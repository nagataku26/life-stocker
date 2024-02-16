class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :list_find
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to list_path(@item.list), notice: 'アイテムが登録されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if
      @item.update(item_params)
      redirect_to list_item_path(@list, @item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :stock_count, :stock_place, :purchase_id, :purchase_date, :expiration_id, :expiration_date, :purchase_plan, :purchase_plan_count, :url, :memo, :image)
  end

  def list_find
    @list = List.find(params[:list_id])
  end

  def item_find
    @item = @list.items.find(params[:id])
  end
  
end
