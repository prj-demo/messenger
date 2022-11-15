module ApplicationHelper
  def greeting
    t('application.welcome', user: Current.user.email )
  end

  def active_class(path)
    default_class = 'list-group-item sub-item list-group-item-action list-group-item-light p-7 d-flex'
    current_page?(path) ? "#{ default_class} active" : default_class
  end

  def channel_active(channel)
    @channel && channel.name.downcase == @channel.name.downcase ? 'active' : ''
  end
end
