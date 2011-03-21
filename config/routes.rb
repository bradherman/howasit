Howasit::Application.routes.draw do
  #  match "users" => "site#coming_soon"
  #  match "coupons" => "site#coming_soon"
  #  match "businesses" => "site#coming_soon"
  #  match "surveys" => "site#coming_soon"
  #  match "users/logout"  => "site#coming_soon"
  #  match "user/businesses" => "site#coming_soon"
  #  match "mobile/index" => "site#coming_soon"
  #  match "mobile/search" => "site#coming_soon"
  #  match "site/about" => "site#coming_soon"
  #  match "site/pricing" => "site#coming_soon"
  #  match "site/contact" => "site#coming_soon"
  #  match "site/support" => "site#coming_soon"
  #  match "site/index" => "site#coming_soon"
  #  match "site/blog" => "site#coming_soon"
  #  match "site/tour" => "site#coming_soon"
  #  match "users/:id" => "site#coming_soon"
  #  match "businesses/:id" => "site#coming_soon"
  #  match "coupons/:id" => "site#coming_soon"
  #  match "surveys/:id" => "site#coming_soon"
  #  match "/" => "site#coming_soon"
  #  root :to => "site#coming_soon"
  
  resources   :coupons
  resources   :surveys
  resources   :businesses
  resources   :users
  resource    :user_session
  resource    :account,       :controller => "users"
  
  match 'user/businesses' => 'users#businesses'
  match 'user/surveys'    => 'users#surveys'
  match 'user/coupons'    => 'users#coupons'
  
  match 'businesses/destroy/:id'  => 'businesses#destroy',    :as => "delete_business"
  match 'surveys/destroy/:id'     => 'surveys#destroy',       :as => "delete_survey"
  match 'coupons/destroy/:id'     => 'coupons#destroy',       :as => "delete_coupon"
  match 'user_sessions/new'       => 'user_sessions#new',     :as => "login"
  match 'user_sessions/destroy'   => 'user_sessions#destroy', :as => "logout"
  
  match '/' => 'mobile#index', :constraints => { :subdomain => "m" }
  match '/search' => 'mobile#search', :constraints => { :subdomain => "m" }
  match '/survey' => 'mobile#survey', :constraints => { :subdomain => "m" }
  
  match '/about'      => "site#about",      :as => "about"
  match '/contact'    => "site#contact",    :as => "contact"
  match '/faq'        => "site#faq",        :as => 'faq'
  match '/investors'  => "site#investors",  :as => "investors"
  match '/partners'   => "site#partners",   :as => "partners"
  match '/press'      => "site#press",      :as => "press"
  match '/pricing'    => "site#pricing",    :as => "pricing"
  match '/support'    => "site#support",    :as => 'support'
  match '/team'       => "site#team",       :as => "team"
  match '/tour'       => "site#tour",       :as => 'tour'
  
  root  :to => "site#index"
end
