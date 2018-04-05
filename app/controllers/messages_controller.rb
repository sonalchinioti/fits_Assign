class MessagesController < ApplicationController

layout "site"
before_action :set_message, only: [:show]



def index 

	@messages = Message.where(:sender_id => current_user.id).or(Message.where(:recipient_id => current_user.id))

end 


def new 
	@message = Message.new

end 

def create
	@message = Message.new(message_params)
	@message.sender_id = current_user.id
      respond_to do |format|
			if @message.save
				format.html{ redirect_to messages_path, :notice => "Message has been sent" }
			else
				format.html{ render :new }
			end
		end


end 


def show 

end 


private 

    def message_params
			params.require(:message).permit(:recipient_id, :body)
    end

    def set_message
        @message = Message.find(params[:id]) if params[:id]
    end 



end 