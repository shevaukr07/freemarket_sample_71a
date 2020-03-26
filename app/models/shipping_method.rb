class ShippingMethod < ActiveHash::Base
  self.data = [
    {id: 1, value: '未定'},
    {id: 2, value: 'ゆうパック'},
    {id: 3, value: 'ゆうパケット'},
    {id: 4, value: 'レターパック'},
    {id: 5, value: '普通郵便(定形,定形外)'},
    {id: 6, value: 'クロネコヤマト'},
    {id: 7, value: 'クリックポスト'}
]
end
