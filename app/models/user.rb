# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nick                   :string(255)
#  admin                  :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  banned_at              :datetime
#  is_active              :boolean          default(TRUE)
#  ban_reason             :string(255)
#  banned_by_id           :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # All administrators :)
  scope :admins, -> { where(admin: true) }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nick,
                  :is_active, :banned_by_id, :ban_reason, :banned_at

  validates :nick, presence: true

  def self_ban
    update_attribute(:banned_at, Time.current)
    update_attribute(:ban_reason, t(:self_destroy))
    update_attribute(:banned_by_id, read_attribute(:id))
    update_attribute(:is_active, false)
  end

  def unban
    update_attribute(:banned_at, nil)
    update_attribute(:ban_reason, nil)
    update_attribute(:banned_by_id, nil)
    update_attribute(:is_active, true)
  end

  def active_for_authentication?
    super && is_active
  end
end
