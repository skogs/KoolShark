class PagesController < ApplicationController

  USER_ID, PASSWORD = "admin", "123"
  before_filter :basic_authenticate, :only => [ :basic_auth ]

  def home
  end

  def test404
    render :file => "public/404.html", :status => 404, :layout => false
  end

  def basic_auth
    render :text => "you successfully passed the basic auth"
  end

private
   def basic_authenticate
      authenticate_or_request_with_http_basic do |id, password| 
          id == USER_ID && password == PASSWORD
      end
   end


end
