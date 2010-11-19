class PagesController < ApplicationController

  USERS = { "admin" => "123" }

  before_filter :digest_authenticate, :only => [ :digest_auth ]
  before_filter :basic_authenticate,  :only => [ :basic_auth ]
  
  def home
  end

  def test404
    render :file => "public/404.html", :status => 404, :layout => false
  end

  def basic_auth
    render :text => "you successfully passed the basic auth"
  end

  def digest_auth
    render :text => "you successfully passed the basic auth"
  end

private
   def basic_authenticate
      authenticate_or_request_with_http_basic do |id, password| 
          password == USERS[id]
      end
   end

   def digest_authenticate
     authenticate_or_request_with_http_digest do |name|
       USERS[name]
     end
   end

end
