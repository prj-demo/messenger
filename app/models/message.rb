# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_channel_id  (channel_id)
#  index_messages_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  scope :by_limit_times, ->(h=2) { where(created_at: (Time.zone.now - h.hours)..Float::INFINITY)}

  after_create_commit { broadcast_append_to channel }
end
