class UsersController < ApplicationController

  def all_items
    @user = current_user
    @items = @user.items.order(Arel.sql('expiration_date IS NULL, expiration_date ASC'))
  end

  def purchase_plan
    @user = current_user
    @items = @user.items.where(purchase_plan: true).order(Arel.sql('expiration_date IS NULL, expiration_date ASC'))
  end


end
