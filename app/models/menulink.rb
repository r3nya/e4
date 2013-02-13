# coding: UTF-8
# == Schema Information
#
# Table name: menulinks
#
#  id         :integer          not null, primary key
#  title_en   :string(255)      default("NEED ENGLISH TRANSLATION")
#  title_ru   :string(255)      default("НУЖЕН РУССКИЙ ПЕРЕВОД")
#  url        :string(255)
#  range      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menulink < ActiveRecord::Base
  scope :ordered, order('range DESC')

  attr_accessible :range, :title_en, :title_ru, :url
  translate :title

  validates :title_en, presence: true
  validates :url, presence: true
end
