class Purchase < ActiveHash::Base
  self.data = [
    { id: 1, name: '購入日' },
    { id: 2, name: '登録日' },
  ]

  include ActiveHash::Associations
  has_many :items
  end