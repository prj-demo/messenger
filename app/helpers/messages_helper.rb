module MessagesHelper
  def owner_class(message)
    # class_names({
    #   'flex-row-reverse': is_owner?(message)
    # }) + "sender-#{message.user.id}"
    "sender-#{message.user.id}"
  end

  def message_class(message)
    class_names(
      {
        'ms-1': !is_owner?(message), 
        'me-1': is_owner?(message)
      }
    )
  end

  def is_owner?(message)
    p 'owner'.center(100, '-')
    p Current.user
    message.user.id == Current.user.id
  end
end
