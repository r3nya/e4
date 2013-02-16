# == Schema Information
#
# Table name: forums
#
#  id           :integer          not null, primary key
#  title_ru     :string(255)
#  title_en     :string(255)
#  desc_ru      :string(255)
#  desc_en      :string(255)
#  url          :string(255)
#  range        :integer
#  metaforum_id :string(255)
#  newsforum    :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Forum < ActiveRecord::Base
  scope :ordered, order('range DESC')

  attr_accessible :desc_en, :desc_ru, :metaforum_id, :newsforum, :range, :title_en, :title_ru, :url
  translate :title, :desc

  validates :title_en, presence: true
  validates :title_ru, presence: true
  validates :desc_en, presence: true
  validates :desc_ru, presence: true
  validates :url, presence: true
  validates :range, presence: true

  belongs_to :metaforum
end
