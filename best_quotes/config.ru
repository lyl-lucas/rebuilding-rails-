require './config/application'
class ResponseTimer
  def initialize(app, message = "Response Time")
    @app = app
    @message = message
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    @start = Time.now
    @status, @headers, @response = @app.call(env)
    @stop = Time.now
    [@status, @headers, self]
  end

  def each(&block)
    if @headers["Content-Type"].include? "text/html"
      block.call("<!-- #{@message}: #{@stop - @start} -->\n")
    end

    @response.each(&block)
  end
end
use ResponseTimer, "Load Time"
run BestQuotes::Application.new
