# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  title_en   :string(255)
#  title_ru   :string(255)
#  uri        :string(255)
#  content_ru :string(255)
#  content_en :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StaticPage < ActiveRecord::Base
  translate :title, :content

  attr_accessible :content_en, :content_ru, :title_en, :title_ru, :uri, :title, :content
end
