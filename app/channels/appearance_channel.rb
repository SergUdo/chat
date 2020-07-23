class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    logger.info "Subscribed to AppearanceChannel"

    stream_from "appearance_channel"

    current_user.update!(online: true)
    broadcast_users
  end

  def unsubscribed
    logger.info "Unsubscribed to AppearanceChannel"

    current_user.update!(online: false)
    broadcast_users
  end

  private

  def broadcast_users
    ActionCable.server.broadcast "appearance_channel", users: User.online.pluck(:nickname)
  end
end
