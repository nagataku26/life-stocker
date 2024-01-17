class List < ApplicationRecord
  has_one_attached :image
  has_many :user_lists, dependent: :destroy
  has_many :users, through: :user_lists, dependent: :destroy
  has_many :items, dependent: :destroy

  with_options presence: true do
    validates :list_name
    validates :list_password, length: { is: 4 },
                             format: { with: /\A\d{4}\z/, message: 'は4桁の半角数字で入力してください' }
  end

  def show
    @user = current_user
    @items = @user.items.order(Arel.sql('expiration_date IS NULL, expiration_date ASC'))
  end
end
