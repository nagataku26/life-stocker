class UsersController < ApplicationController

  def show
    @user = current_user
    @items = @user.items.order(Arel.sql('expiration_date IS NULL, expiration_date ASC'))
  end

end
