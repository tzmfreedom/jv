module Jv
  class Render
    def initialize(context)
      @context = context
    end

    def call(options)
      render_collection = options[:collection].present?
      options[:locals] ||= {}
      options[:locals].merge!(r: self, _partial: true) if render_collection
      json = @context.render options
      if render_collection
        json.prepend('[')
        json[-1] = ']'
      end
      JSON.load(json)
    end
  end
end
