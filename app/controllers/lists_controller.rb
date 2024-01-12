class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  private

  def list_params
    params.require(:list).permit(:list_name, :list_password, :image)
  end

end
