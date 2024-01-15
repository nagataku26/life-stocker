class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :expiration
  has_one_attached :image
  belongs_to :list

  with_options presence: true do
    validates :item_name
    validates :stock_count
    validates :expiration_id
  end

  validates :expiration_id, numericality: { other_than: 1 , message: "選択してください"}
end
