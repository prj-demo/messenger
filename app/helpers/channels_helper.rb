module ChannelsHelper
  def create_personal_channel(user)
    channel_name = generate_personal_channel_name(user)
    Channel.by_channel_name(channel_name) || Channel.create_personal_channel(channel_name, user)
  end

  private

  def generate_personal_channel_name(user)
    [user.username, Current.user.username].sort.join('-')
  end
end
