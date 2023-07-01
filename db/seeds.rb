# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者情報の登録
admin = Admin.create(email: 'b@b', password: 'bbbbbb')

# ジャンル情報の登録
genre1 = Genre.create(name: 'ケーキ')
genre2 = Genre.create(name: 'パン')

# 商品情報の登録
item1 = Item.create(name: 'いちごのショートケーキ', genre_id: genre1.id, price_no_tax: 1000, body: 'itigo')
# item2 = Item.create(image: 'images/no_image.jpg',name: 'クリームパン', genre_id: genre2.id, price_no_tax: 2000,body: 'opjpo')