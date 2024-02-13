class List < ApplicationRecord
  has_one_attached :image
  has_many :user_lists, dependent: :destroy
  has_many :users, through: :user_lists
  has_many :items, dependent: :destroy

    validates :list_name, presence: true
    validates :shared_id, length: {in: 4..10 },
                             format: { with: /[a-z\d]/i, message: 'は4桁以上10桁以内の半角英数字で入力してください'},
                             allow_blank: true
    validates :shared_password, length: { is: 4 },
                             format: { with: /\A\d{4}\z/, message: 'は4桁の半角数字で入力してください' },
                             allow_blank: true

  def show
    @user = current_user
    @items = @user.items.order(Arel.sql('expiration_date IS NULL, expiration_date ASC'))
  end

end
