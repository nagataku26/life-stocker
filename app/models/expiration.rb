class Expiration < ActiveHash::Base
  self.data = [
    { id: 1, name: '期限なし' },
    { id: 2, name: '消費期限' },
    { id: 3, name: '賞味期限' },
    { id: 4, name: 'その他期限' },
  ]

  include ActiveHash::Associations
  has_many :items
  end