# coding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Menulink.create([{ title_en: 'News', title_ru: 'Новости', url: 'news', range: 2 },
                 { title_en: 'Forum', title_ru: 'Форум', url: 'forum', range: 1 }])
