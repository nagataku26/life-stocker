class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :expiration
  belongs_to :purchase
  has_one_attached :image
  belongs_to :list

  with_options presence: true do
    validates :item_name
    validates :stock_count
    validates :expiration_id
    validates :purchase_id
  end
  
  def expired?
    expiration_date.present? && expiration_date < Date.current
  end
end
