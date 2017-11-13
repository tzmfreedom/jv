require 'benchmark/ips'

class ApiController < ApplicationController
  def index
    n = params.fetch(:n, 100).to_i
    @string = 'hoge'
    @integers = (1..n).to_a
    @records = n.times.map { {a: 'foo', b: 'bar'} }

    if params[:bench]
      jbuilder = render_to_string('jbuilder')
      jv = render_to_string('index')
      raise 'jv != jbuilder' unless jv == jbuilder

      result = Benchmark.ips do |x|
        x.report('jbuilder') { render_to_string('jbuilder') }
        x.report('jv') { render_to_string('index') }
        x.compare!
      end

      render plain: result.data.to_json
    end

    if params[:jbuilder]
      render :jbuilder
    end
  end
end
