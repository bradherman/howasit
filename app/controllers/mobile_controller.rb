class MobileController < ApplicationController
  def index
    @title = "Mobile"
    
    #@tags = Tag.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"])   
    #request.remote_ip
  end
  
  def survey
    #restaurant list
  end
  
  def search
    @longitude = params[:long]
    @latitude = params[:lat]
    @businesses = Business.all
  end
end
