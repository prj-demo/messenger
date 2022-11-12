# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  status                 :integer          default("offline")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :all_except_current_user, -> { where.not(id: Current.user) }

  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  enum status: [:offline, :online]

  # after_create_commit { broadcast_prepend_to :users }
  # after_update_commit { broadcast_update_to :users }
  # after_destroy_commit { broadcast_remove_to :users }
  # OR
  broadcasts_to ->(user) { :users }, inserts_by: :prepend
  after_commit :update_user_total, :update_dashboard

  def username
    email.split(/@/).first
  end

  def by_personal_channels
    Channel.joins(:participants).personal.where(participants:{user_id: self.id})
  end

  private

  def update_user_total
    onlines = User.online.count
    offlines = User.offline.count

    broadcast_update_to 'user-total', target: 'user-total', partial: 'channels/users/total', locals: { onlines: onlines, offlines: offlines }
  end  
end
