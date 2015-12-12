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

    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:name, :description, :event_id)
    end
end
