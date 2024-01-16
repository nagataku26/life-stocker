class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to list_path(@item.list), notice: 'アイテムが登録されました'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :stock_count, :stock_place, :purchase_id, :purchase_date, :expiration_id, :expiration_date, :purchase_plan, :purchase_plan_count, :url, :memo, :image).merge(list_id: params[:list_id])
  end
end
