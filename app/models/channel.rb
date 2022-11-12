# == Schema Information
#
# Table name: channels
#
#  id         :bigint           not null, primary key
#  group      :integer          default("personal")
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Channel < ApplicationRecord
  validates_uniqueness_of :name

  has_many :participants, dependent: :destroy
  has_many :messages, dependent: :destroy

  enum group: [:personal, :common]

  # after_create_commit { broadcast_prepend_to :channels }
  # after_update_commit { broadcast_update_to :channels }
  # after_destroy_commit { broadcast_remove_to :channels }
  # OR
  broadcasts_to ->(channel) { :channels }, inserts_by: :prepend
  after_commit :update_dashboard

  def joined?
    participants.where(user_id: Current.user.id).any?
  end

  def join_channel
    participants.create(user_id: Current.user.id)
  end

  def update_info
    broadcast_update_to :channels
  end

  class << self
    def by_channel(channel_id)
      find_by(id: channel_id)
    end

    def by_channel_name(channel_name)
      where('lower(name) = ?', channel_name.downcase).first
    end

    def create_personal_channel(channel_name, user)
      channel = Channel.create(name: channel_name, group: Channel::groups[:personal])
      Participant.create(
        [Current.user, user].map { |u| { user_id: u.id, channel_id: channel.id } }
      )
      channel
    end
  end
end
