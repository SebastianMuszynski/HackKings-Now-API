class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update, :destroy]

  def index
    @notifications = Notification.all
    render_json(@notifications)
  end

  def show
    render_json(@notification)
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      begin
        Pusher.trigger(Event.find(notification_params[:event_id]).name, 'new_notification', { message: notification_message })
      rescue Pusher::Error => e
        render_error("Could not create a notification.")
      end
      render_json(@notification, :created)
    else
      render_json(@notification.errors, :unprocessable_entity)
    end
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      head :no_content
    else
      render_json(@notification.errors, :unprocessable_entity)
    end
  end

  def destroy
    @notification.destroy
    head :no_content
  end

  private

    def notification_message
      notification_params[:name] + ": " + notification_params[:description]
    end

    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.permit(:name, :description, :event_id)
    end
end
