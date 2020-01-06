This file should contain all the record creation needed to seed the database with its default values.
The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Examples:

  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  Character.create(name: 'Luke', movie: movies.first)



Customer.create(
  email: "test@test.com", password: "password"
)

Item.create!(
  genre_id: 1,
  name: 'ショートサンタケーキ',
  description: 'ちっちゃいサンタさんが乗ったかわいいショートケーキ',
  price: '7000',
  image_id: 'images/santa_cake.jpg'
  
)
5.times do |i|
    Item.create!(genre_id: 1, name: "ケーキ#{i += 1}", description: "美味しいケーキ美味しいケーキ美味しいケーキ", price: 5000)
  end



DeliverInfo.create!(
  customer_id: 1,
  name: '田中 勇気',
  address: '神奈川県横浜市港北区大井戸町26番地123-34',
  postal_code: '223-3455'
)

Order.create!(
  customer_id: 1,
  postage: '800',
  total_price: '3000',
  name: '高木マカダミア',
  order_postal_code: '244-4444',
  address: '鎌倉県群馬区中央'
)
OrderItem.create!(
  customer_id: 1,
  order_id: 1,
  item_id: 1,
  number: 2,
  price: 14000,
  making_status: 0
)
Genre.create!(
  [
    {name: "ケーキ"},
    {name: "焼き菓子"},
    {name: "プリン"},
    {name: "キャンディ"}
  ]
)
