module Api
    module V1
        class MessagesController < ApplicationController
            respond_to :json
            
            def index
                @messages = Message.all
                respond_with @messages
            end
            
            def show
                @messages = Message.find(params[:id])
                respond_with @messages
            end
            
            def create 
                respond_with Message.create(params[:message])
            end
            
            def update
                respond_with Message.update(params[:id], params[:message])
            end
            
            def destroy
                respond_with Message.destroy(params[:id])
            end
        end
    end
end