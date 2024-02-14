class ListsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :list_find, only: [:show, :edit, :update, :destroy]

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

  def update
    if
      @list.update(list_params)
      redirect_to list_path(@list.id)
    else
      render :edit, status: :unprocessable_entity
    end
    
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  def join
    @list = List.new
  end

  def join_list
    @user = current_user
    @list = List.find_by(shared_id: params[:shared_id], shared_password: params[:shared_password])
    if @list
      if current_user.lists.include?(@list)
        flash.now[:alert] = "既にリストに参加しています。"
        render :join
      else
        @user.user_lists.create(list: @list)
        redirect_to @list
      end
    else
      flash.now[:alert] = "共有IDまたは共有パスワードが正しくありません"
      render :join
    end
  end


  private

  def list_params
    params.require(:list).permit(:list_name, :shared_id, :shared_password, :image).merge(user_ids: [current_user.id])
  end

  def list_find
    @list = List.find(params[:id])
  end

end
