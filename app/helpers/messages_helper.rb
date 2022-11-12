module MessagesHelper
  def sender_class(prefix, message)
    "#{prefix}-#{message.user.id}"
  end

  def owner_class(message)
    class_names({
      'flex-row-reverse': is_owner?(message)
    })
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
    message.user.id == Current.user.id
  end
end
