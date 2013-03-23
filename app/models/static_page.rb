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

  attr_accessible :content_en, :content_ru, :title_en, :title_ru, :uri

  validates :content_en, presence: true
  validates :title_en, presence: true
  validates :uri, presence: true
  validate :no_cross_with_controllers

  def no_cross_with_controllers
    # There's no way to create static page with uri, which already mapped to another controller.
    # I. e. you can't create page with uri 'forum/rules', because it mapped to 'forum#show' (finding
    # forum, which have uri 'rules').
    # It's a technical restriction, not author's fault
    # TODO: auto-detect busy URLs
    busy_urls = ['admin', 'forum', 'comments']
    busy_urls.each do |bu|
      if uri.starts_with?(bu)
        errors.add(:uri, (I18n.t('objects.page.errors.invalid_start', :busy => bu)))
      end
    end
  end
end
