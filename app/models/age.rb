class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '10代後半〜20代前半' },
    { id: 3, name: '20代後半〜30代前半' },
    { id: 4, name: '30代後半〜40代前半' },
    { id: 5, name: '40代後半〜50代前半' },
    { id: 6, name: '50代後半〜'}
  ]

  include ActiveHash::Associations
  has_many :users
end
