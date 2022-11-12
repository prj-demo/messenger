class ChannelsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @channel = Channel.by_channel(params[:id])
    @channel.join_channel unless @channel.joined?
    fetch_data_from_channel
    render 'index'
  end
end
