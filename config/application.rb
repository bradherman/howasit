require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Howasit
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
    
    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    # config.time_zone = 'Central Time (US & Canada)'
    
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.plugins = [ :dynamic_form, :blog_kit ]
    config.filter_parameters += [:password, :password_confirmation]
    config.action_view.javascript_expansions[:admin_defaults] = %w(jquery.min jrails rails facebox wysiwyg simpla_config)
    config.action_view.javascript_expansions[:site_defaults] = %w(jquery.min easySlider1.5 saas cookie twitter)
    config.action_view.javascript_expansions[:mobile_defaults] = %w(jquery.min jqtouch.min jqtouch.transitions jqt.location http://maps.google.com/maps/api/js?sensor=false)
    config.action_view.stylesheet_expansions[:mobile] = %w(jqtouch.min theme.min)
    config.action_view.stylesheet_expansions[:admin] = %w(reset admin invalid blue)
    config.action_view.stylesheet_expansions[:site] = %w(http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:bold&subset=latin screen default)
    config.encoding = "utf-8"
  end
end
