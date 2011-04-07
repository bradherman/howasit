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
    @businesses = Business.near(["#{params[:lat]}, #{params[:long]}"],1)
  end
end
