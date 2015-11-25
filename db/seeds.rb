# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.destroy_all
Category.destroy_all
MainDatum.destroy_all
Admin.create!(name: 'Admin', password: '123')
Category.create!([{ title: 'Кровля' }, { title: 'Рубироид' }, { title: 'Цемент' }])
MainDatum.create!(title: 'Экострой', telephone: '+7 (915) 843 0939', address: 'ИВ. ОБЛ., Г. КИНЕШМА, УЛ. 2-Я ШУЙСКАЯ, Д. 1Н', about: 'Описание фримы')