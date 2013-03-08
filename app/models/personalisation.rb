# == Schema Information
#
# Table name: personalisations
#
#  id         :integer          not null, primary key
#  data_ru    :string(255)
#  data_en    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Personalisation < ActiveRecord::Base
  translate :data
  attr_accessible :data_en, :data_ru
end
