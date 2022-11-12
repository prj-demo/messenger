# == Schema Information
#
# Table name: participants
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_participants_on_channel_id  (channel_id)
#  index_participants_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#  fk_rails_...  (user_id => users.id)
#
class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  # after_commit :update_channel_info
  after_create_commit { update_channel_info }

  private

  def update_channel_info
    p self
    # broadcast_update_to target: "channel_#{self.channel_id}", partial: 'channels/channel', locals: { channel: self.channel }
    broadcast_replace_to :channels, target: "channel_#{self.channel_id}", partial: 'channels/channel', locals: { channel: self.channel }
  end
end
