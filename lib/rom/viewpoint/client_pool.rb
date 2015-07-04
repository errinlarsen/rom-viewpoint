require 'rom/viewpoint/support/client_id'
require 'rom/viewpoint/support/null_client'

module ROM
  module Viewpoint
    class ClientPool < Registry
      def initialize(elements={})
        super({null: NullClient.new(self)}.merge elements)
      end

      def []=(id, client)
        elements[id] = client
      end

      def [](id)
        elements.fetch(id) { raise(ClientMissingError, id) }
      end

      def null_client
        self[:null]
      end

      # alias_method :client?, :key?

      def client(id_or_endpoint, username=nil, password=nil, options={})
        if id_or_endpoint.is_a?(ClientID)
          return self[id]
        else
          realize_client(id_or_endpoint, username, password, options)
        end
      end

      private

      def realize_client(endpoint, user, pass, opts={})
        id = ClientID.new(endpoint: endpoint, username: user, options: opts)
        self[id] = ::Viewpoint::EWSClient.new(endpoint, user, pass, opts)
      end
    end
  end
end
