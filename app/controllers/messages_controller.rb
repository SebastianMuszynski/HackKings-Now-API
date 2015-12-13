class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  def index
    @messages = Message.all
    render_json(@messages)
  end

  def show
    render_json(@message)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      begin
        Pusher.trigger(Event.find(message_params[:event_id]).name, 'new_message', { message: message_params[:text] })
      rescue Pusher::Error => e
        render_error("Could not create a message.")
      end
      render_json(@message, :created)
    else
      render_json(@message.errors, :unprocessable_entity)
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      head :no_content
    else
      render_json(@message.errors, :unprocessable_entity)
    end
  end

  def destroy
    @message.destroy
    head :no_content
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.permit(:text, :event_id)
    end
end
