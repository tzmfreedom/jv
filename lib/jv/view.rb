module Jv
  class View
    def initialize(hash)
      @hash = hash
    end

    def to_s
      "#{@hash.to_json},"
    end
  end
end
