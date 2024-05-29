# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: 'a@a',
  password: 'aaaaaa',
  first_name: 'あやか',
  last_name: '明石屋',
  nick_name: 'aya1',
  )

User.create!(
  email: 'b@b',
  password: 'bbbbbb',
  first_name: 'はな',
  last_name: '馬場',
  nick_name: 'bana2',
  )

User.find_by(email: 'a@a').coffees.create!(
  name: 'イノダコーヒー',
  shop: '百貨店のスーパー',
  place: 0,
  introduction: '今までで一番好み',
  total_rate: 0,
  acidit_rate: 4,
  richness_rate: 1,
  bitterness_rate: 1
  )

User.find_by(email: 'b@b').coffees.create!(
  name: 'Caio Pereira',
  shop: '蔵前のLucent Coffee',
  place: 1,
  introduction: 'お店の雰囲気も素敵で、味も最高だった。',
  total_rate: 1,
  acidit_rate: 3,
  richness_rate: 3,
  bitterness_rate: 2
  )