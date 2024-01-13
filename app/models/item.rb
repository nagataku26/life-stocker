class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :list

  with_options presence: true do
    validates :item_name
    validates :stock_count
    validates :expiration_id
  end
end
