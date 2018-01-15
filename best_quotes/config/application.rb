$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
# require "quotes_controller"
require 'rulerss'
module BestQuotes
  class Application < Rulerss::Application
  end
end
