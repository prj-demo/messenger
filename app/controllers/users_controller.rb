class UsersController < ApplicationController
  include ChannelsHelper
  def show
    @user = User.find_by(id: params[:id])
    @channel = create_personal_channel(@user)
    fetch_data_from_channel
    render 'channels/index'
  end
end
