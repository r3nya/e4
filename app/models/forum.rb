class Forum < ActiveRecord::Base
  attr_accessible :desc_en, :desc_ru, :metaforum_id, :newsforum, :range, :title_en, :title_ru, :url
end
