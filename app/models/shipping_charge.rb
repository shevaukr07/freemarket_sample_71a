class ShippingCharge < ActiveHash::Base
  self.data = [
    {id: 1, value: '着払い(落札者負担)'},
    {id: 2, value: '送料込み(出品者負担)'}
  ]    
end