class MessagesController < ApplicationController
    before_action :find_message, only: [:show, :edit, :update, :destroy]
  
    def index
      @messages = Message.all.order("created_at DESC")
    end
  
    def show
      # Your code for showing a specific message goes here.
    end
  
    def new
      @message = Message.new
    end
  
    def create
      @message = Message.new(message_params)
      if @message.save 
        redirect_to root_path
      else
        render 'new'
      end
    end
  
    # ... other methods ...
    def edit 
    end

    def update
        if @message.update(message_params)
            redirect_to message_path
        else
            render 'edit'
        end
    end

    def destroy
    end

    private
  
    def message_params
      params.require(:message).permit(:title, :description)
    end
  
    def find_message
      @message = Message.find(params[:id])
    end
  end
  