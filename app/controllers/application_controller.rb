class ApplicationController < ActionController::API
    include ActionController::ImplicitRender
    
    before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    render :text => '', :content_type => 'text/plain'
  end
end
    
    #before_filter :add_allow_credentials_headers
    #def add_allow_credentials_headers
  #      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
        #response.headers['Access-Control-Allow-Origin'] = '*'
       # response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      #  response.headers['Access-Control-Allow-Credentials'] = 'true'        
       # response.headers['Access-Control-Request-Method'] = '*'
     #   response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    #end 
    
    def options
        head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
    end
end