class PagesController < ApplicationController
  def home
  end

  def test404
    render file: "public/404.html", status: 404, layout: false
  end


end
