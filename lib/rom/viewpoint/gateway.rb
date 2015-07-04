require 'rom/gateway'
require 'rom/viewpoint/client_pool'
require 'rom/viewpoint/dataset'

module ROM
  module Viewpoint
    class Gateway < ROM::Gateway
      attr_reader :datasets, :logger

      def initialize(client_pool=ClientPool.new)
        @connection = client_pool
        @datasets = {}
      end

      # TODO: would be nice to make use of the logger at some point...
      def use_logger(logger)
        @logger = logger
      end

      def dataset(name)
        @datasets[name] ||= Dataset.new(Array.new, connection.null_client)
      end

      def dataset?(name)
        @datasets.key?(name)
      end

      def [](name)
        @datasets[name]
      end
    end
  end
end
