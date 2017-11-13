require 'jv/handler'

module Jv
  class Railtie < Rails::Railtie
    initializer :jv do
      ActiveSupport.on_load :action_view do
        ActionView::Template.register_template_handler :jv, ::Jv::Handler
      end
    end
  end
end
