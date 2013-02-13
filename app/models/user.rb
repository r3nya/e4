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
