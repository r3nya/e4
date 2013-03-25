# coding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Menulink.create([{ title_en: 'News', title_ru: 'Новости', url: 'news', range: 3 },
                 { title_en: 'Tracker', title_ru: 'Трекер', url: 'tracker', range: 2 }
                 { title_en: 'Forum', title_ru: 'Форум', url: 'forum', range: 1 }])

# Site personalisation
# Data:
#
#   * Personalisation.find(1) = site title
#   * Personalisation.find(2) = team name (used in footer and signs in e-mails)
#   * Personalisation.find(3) = site name (i.e. used on logo)
#   * Personalisation.find(4) = e-mail address (used in e-mails, suddenly)
#   * Personalisation.find(5) = root page (feature: you can redirect users to different root pages, based on user's
#       locale. For exampe, when you releasing new product, Russian users may be transferred to advertisment, but
#       English users may still be transferred to main news page)

Personalisation.create([{ data_en: 'Change me', data_ru: 'Измени меня!' },
                        { data_en: 'Change me team', data_ru: 'Измени меня название команды' },
                        { data_en: 'Change me', data_ru: 'Измени меня' },
                        { data_en: 'change@my.mail', data_ru: 'change@my.mail' },
                        { data_en: 'static_pages#stub', data_ru: 'static_pages#stub' }])
