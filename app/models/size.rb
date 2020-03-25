class Size < ActiveHash::Base
  self.data = [
    {id: 1, value: 'XS以下'},
    {id: 2, value: 'S'},
    {id: 3, value: 'M'},
    {id: 4, value: 'L'},
    {id: 5, value: 'LL'},
    {id: 6, value: '3L'},
    {id: 7, value: '4L以上'},
    {id: 8, value: 'その他'}
  ]
end
