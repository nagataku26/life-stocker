class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_lists = current_user.lists.includes(:items)
    @items = @user_lists.flat_map(&:items)
  end

  def new
    @item = Item.new
    @today = Date.today
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to list_path(@item.list), notice: 'アイテムが登録されました'
    else
      render :new
    end
  end
end
