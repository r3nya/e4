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
  attr_accessible :article, :commentable, :forum_id, :message_en, :message_ru, :moderator_id, :sticky, :subject_en, :subject_ru, :user_id, :visible
  translate :subject, :message

  validates :subject_en, presence: true
  validates :message_en, presence: true
  validates :user_id, presence: true
  validates :forum_id, presence: true

  belongs_to :forum
end
