require "bridge_cache/engine"
require 'bridge_blueprint'

module BridgeCache

    class << self

      WRITER_METHODS = [:use_internal_database]

      attr_writer(*WRITER_METHODS)

      def configure
        yield self if block_given?
      end

      def use_internal_database
        return @use_internal_database if defined?(@use_internal_database)

        @use_internal_database = true
      end

      def primary_key
        @use_internal_database ? :bridge_id : :id
      end
    end
end
