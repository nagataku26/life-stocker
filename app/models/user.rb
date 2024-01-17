class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_lists, dependent: :destroy
  has_many :lists, through: :user_lists
  has_many :items, through: :lists

  validates :nickname, presence: true

  after_create :create_initial_lists

  private
  def create_initial_lists
    disaster_prevention_list = lists.create(list_name: "防災グッズリスト", list_password: "0000")
    purchase_list = lists.create(list_name: "買い物予定リスト", list_password: "0000")
  end
end
