module DashboardHelper
  def summary
    { 
      onlines: User.online.count, 
      total: User.count, 
      commons: Channel.common.count, 
      personals: Current.user.by_personal_channels.count, 
      participants: Current.user.participants.count 
    }    
  end
end
