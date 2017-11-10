require 'bridge_cache/engine'
require 'bridge_blueprint'
require 'active_record'
require 'activerecord-import'
require 'rein'

module BridgeCache
  class << self
    WRITER_METHODS = %w[use_internal_database batch_size is_subaccount].freeze
    READ_METHODS = %w[models].freeze
    READ_WRITE_METHODS = %w[].freeze
    DEFAULT_BATCH_SIZE = 10_000
    DEFAULT_MODELS = %(domain affiliated_sub_account).freeze

    attr_writer(*WRITER_METHODS)
    attr_accessor(*READ_WRITE_METHODS)
    attr_reader(*READ_METHODS)

    def configure
      yield self if block_given?
    end

    def use_internal_database
      return @use_internal_database if defined?(@use_internal_database)

      @use_internal_database = true
    end

    def batch_size
      @batch_size || DEFAULT_BATCH_SIZE
    end

    def models=(models)
      @models = merged_required_models(models)
    end

    def models
      return @models if defined?(@models)

      @models = merged_required_models([])
    end

    def primary_key
      @use_internal_database ? :bridge_id : :id
    end

    def resolved_models(remove_root_models)
      return @models unless remove_root_models
      @models.reject { |model| DEFAULT_MODELS.include?(model) }
    end

    private

    def merged_required_models(models)
      (%w[domain affiliated_sub_account] + models).uniq
    end
  end
end
