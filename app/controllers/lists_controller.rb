class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :list_find, only: [:show, :edit]

  def index
    @user_lists = current_user.lists
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
    @items = @list.items
  end

  def edit
  end

  private

  def list_params
    params.require(:list).permit(:list_name, :list_password, :image).merge(user_ids: [current_user.id])
  end

  def list_find
    @list = current_user.lists.find(params[:id])
  end

end
