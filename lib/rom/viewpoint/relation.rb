module ROM
  module Viewpoint
    class Relation < ROM::Relation
      adapter :viewpoint

      def self.finalize(rom, relation)
        relation.exposed_relations << :connect_with
      end

      forward :get_folder, :find_items, :items_since, :length

      def connect_with(endpoint, username, password, ews_options={})
        __new__(dataset.connect(endpoint, username, password, ews_options))
      end

      def to_a
        if dataset.connected?
          super
        else
          raise(
            ClientNotConnectedError,
            "#{relation.class}#connect_with(endpoint, username, password) " \
            'must be called before materialization'
          )
        end
      end
    end
  end
end
