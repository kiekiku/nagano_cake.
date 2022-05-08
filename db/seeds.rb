# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "aaa@a",
    password: "aaaaaa"
)

Customer.create!(

    email: "bbb@b",
    password: "bbbbbb",
    last_name: "山田",
    first_name: "花子",
    last_name_kana: "ヤマダ",
    first_name_kana: "ハナコ",
    postal_code: "111-1111",
    address: "東京都渋谷区",
    telephone_number: "000-0000",
    is_active: true
)