module ActionView
  module Helpers
    module TagHelper
      private
        def tag_options(options, escape = true)
          unless options.blank?
            attrs = []
            if escape
              options.each do |key, value|
                next unless value
                key = key.to_s
                value = BOOLEAN_ATTRIBUTES.include?(key) ? key : ERB::Util::html_escape(value)
                attrs << %(#{key}="#{value}")
              end
            else
              attrs = options.map { |key, value| %(#{key}="#{value}") }
            end
            " #{attrs.sort * ' '}" unless attrs.empty?
          end
        end
    end
  end
end