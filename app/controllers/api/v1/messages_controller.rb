module Api
    module V1
        class MessagesController < ApplicationController
            respond_to :json
            
            # Full list of status codes can be found at https://en.wikipedia.org/wiki/List_of_HTTP_status_codes, but you’re most likely to use only limited subset of them:

            # 200 - :ok
            # 204 - :no_content
            # 400 - :bad_request
            # 403 - :forbidden
            # 401 - :unauthorized
            # 404 - :not_found
            # 410 - :gone
            # 422 - :unprocessable_entity
            # 500 - :internal_server_error
            
            def index
                @messages = Message.all
                respond_with @messages
                # @hola = {hola: 'hola', message: @messages}
                # respond_with @hola
                # Use this ^ code without the views/api layout
            end
            
            def show
                @messages = Message.find(params[:id])
                respond_with @messages
            end
            
            def create 
                Message.create(message_params)
              #  @hola = {saved: 'hola'}
               # respond_with @hola
                render json: {message: 'Great'}, status: 200
            end
            
            def update
                respond_with Message.update(params[:id], params[:message])
            end
            
            def destroy
                respond_with Message.destroy(params[:id])
            end
            
            private 
            def message_params 
                params.require(:message).permit(:content) 
            end
        end
    end
end