module DashboardHelper
  def summary
    { 
      onlines: User.online.count, 
      total: User.count, 
      commons: Channel.common.count, 
      personals: Current.user ? Current.user.by_personal_channels.count : 0, 
      participants: Current.user ? Current.user.participants.count : 0
    }    
  end
end
