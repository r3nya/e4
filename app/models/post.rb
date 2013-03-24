# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  subject_en   :string(255)
#  subject_ru   :string(255)
#  message_en   :string(255)
#  message_ru   :string(255)
#  user_id      :integer
#  forum_id     :integer
#  moderator_id :integer          default(1)
#  sticky       :boolean          default(FALSE)
#  visible      :boolean          default(TRUE)
#  commentable  :boolean          default(TRUE)
#  article      :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ActiveRecord::Base
  acts_as_commentable

  scope :ordered, order('sticky DESC, created_at DESC')
  # Forum post may be a news article (indicated by flag 'article').
  # Differences between forum post and news article:
  #
  #   * every news article needs translation to every language enabled on site. Forum post needs only one text variant,
  #        (saved in _en place, because :en is default locale and it will bring to user by default)
  #   * news articles divided to scope, called 'news', for using in news viewing module (i. e. for main page)
  #   * news article may be posted only by administrator
  #
  # News in scope become uncategorized. Only 'sticky' flag works (sticky news article will be sticky everywhere). This is a
  # feature, not a bug.
  scope :news, -> { where(article: true) }

  attr_accessible :article, :commentable, :forum_id, :message_en, :message_ru, :moderator_id, :sticky, :subject_en, :subject_ru, :user_id, :visible
  translate :subject, :message

  validates :subject_en, presence: true
  validates :message_en, presence: true
  validates :user_id, presence: true
  validates :forum_id, presence: true

  belongs_to :forum

  belongs_to :user

  def to_param
    @tutle = Russian::transliterate(subject_en)
    "#{id}-#{@tutle.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
