class Business < ActiveRecord::Base
  belongs_to  :user
  has_one     :coupon
  has_one     :survey
  
  geocoded_by :address
  
  after_validation :geocode
  
  validates_presence_of :name, :phone, :street, :city, :state, :zip
  
  def address
    [street, city, state, zip].compact.join(', ')
  end
  
  def survey
    if survey_id
      Survey.find(survey_id)
    else
      nil
    end
  end
end
