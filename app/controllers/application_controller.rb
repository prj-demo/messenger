class ApplicationController < ActionController::Base
  before_action :set_current_user, if: :user_signed_in?
  before_action :set_data

  def fetch_data_from_channel
    @messages = @channel.messages.order(created_at: :asc)
    @participants = @channel.participants.count
    @message = Message.new
  end
  private

  def set_current_user
    Current.user = current_user
  end

  def set_data
    return if current_user && current_user.is_admin?
    # get all user except user signed (current user)
    @users = User.all_except_current_user.order(status: :desc)

    # will store common channel
    @channels = common_channel + personal_channel
    
    @onlines = User.online.count
    @offlines = User.offline.count
  end  

  def after_sign_in_path_for(resource)
    if resource.is_admin?
      return avo_path
    end
    root_path
  end  

  def common_channel
    Channel.includes(:participants).common
  end

  def personal_channel
    Current.user ? Current.user.by_personal_channels : []
  end
end
