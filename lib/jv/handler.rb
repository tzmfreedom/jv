require 'jv/render'

module Jv
  class Handler
    cattr_accessor :default_format
    self.default_format = Mime[:json]

    def self.call(template)
      <<~SRC
        r ||= Jv::Render.new(self)
        _partial ||= nil
        hash = ->{ #{template.source} }.()
        _partial.nil? ? hash.to_json : "\#{hash.to_json},"
      SRC
    end
  end
end
