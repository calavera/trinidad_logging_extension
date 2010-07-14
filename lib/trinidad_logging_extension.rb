module Trinidad
  module Extensions
    module Logging
      VERSION = '0.1.0'
    end

    __DIR__ = File.dirname(__FILE__)
    require File.expand_path('../trinidad-libs/juli-adapters', __DIR__)
    require File.expand_path('../trinidad-libs/log4j-1.2.16', __DIR__)

    class LoggingWebAppExtension < WebAppExtension
      def configure(tomcat, app_context)
        @options[:config] ||= 'config/trinidad-logging.properties'
        java.lang.System.set_property('log4j.configuration', 
          java.io.File.new(File.expand_path(@options[:config])).to_url.to_s)
      end
    end
  end
end
