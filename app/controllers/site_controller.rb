class SiteController < ApplicationController
  layout "site", :except => [:coming_soon, :pricing]
  
  def index
    @title = "Connecting Businesses and People"
    @index = true
  end

  def about
    @title = "About Us"
    @header = "About howas.it"
  end

  def pricing
    @title = "Pricing"
    @header = "Plans and Pricing"
  end

  def contact
    @title = "Contact"
    @header = "Contact Us"
  end

  def tour
    @title = "Features"
    @header = "Features Tour"
  end
  
  def support
    @title = "Support"
    @header = "Support"
  end
  
  def blog
    @title = "Blog"
    @header = "Blog"
  end
  
  def coming_soon
    @title = "Coming soon..."
  end
  
  def team
    @title = "Our Team"
    @header = "Our Team"
  end
  
  def press
    @title = "In the Press"
    @header = "In the Press"
  end
  
  def partners
    @title = "Our Partners"
    @header = "Our Partners"
  end
  
  def investors
    @title = "Investors"
    @header = "Investor Information"
  end
  
  def faq
    @title = "FAQ"
    @header = "Frequently Asked Questions"
  end
end
