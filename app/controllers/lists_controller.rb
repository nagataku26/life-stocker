class ListsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :list_find, only: [:show, :edit, :destroy]

  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @items = @list.items.order(Arel.sql('expiration_date IS NULL, expiration_date ASC'))
  end

  def edit
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:list_name, :list_password, :image).merge(user_ids: [current_user.id])
  end

  def list_find
    @list = current_user.lists.find(params[:id])
  end

end
