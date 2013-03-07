# == Schema Information
#
# Table name: metaforums
#
#  id         :integer          not null, primary key
#  title_en   :string(255)
#  title_ru   :string(255)
#  desc_ru    :string(255)
#  desc_en    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Metaforum < ActiveRecord::Base
  attr_accessible :desc_en, :desc_ru, :title_en, :title_ru
  translate :title, :desc

  validates :title_en, presence: true
  validates :title_ru, presence: true
  validates :desc_en, presence: true
  validates :desc_ru, presence: true

  has_many :forums

  def destroy
    # You can't delete any non-empty object, motherfucker
    unless forums.count != 0
      super
    end
  end
end
