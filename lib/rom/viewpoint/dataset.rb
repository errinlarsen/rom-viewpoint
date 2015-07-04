require 'rom/support/array_dataset'

module ROM
  module Viewpoint
    class Dataset
      include ArrayDataset

      attr_reader :client

      def self.row_proc
        -> obj do
          attributes_for(obj).each_with_object({}) do |attribute, tuple|
            tuple[attribute] = obj.public_send(attribute)
          end
        end
      end

      def self.attributes_for(obj)
        case obj
        when ::Viewpoint::EWS::Types::CalendarFolder
          [:id, :display_name, :total_count]
        when ::Viewpoint::EWS::Types::CalendarItem
          [:id, :subject]
        end
      end

      def initialize(data, client, options={})
        @client = client
        super(data, options)
      end

      def connect(endpoint, username, password, ews_options={})
        if connected?
          return self
        else
          new_client = client.connect(endpoint, username, password, ews_options)
          self.class.new(data, new_client)
        end
      end

      def connected?
        !!client.ews
      end

      [
        :get_folder, :find_items
      ].each do |method_name|
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{method_name}(*args, &block)
            response = client.public_send(#{method_name.inspect}, *args, &block)

            if response.equal?(data)
              self
            else
              self.class.new(Array(response), client)
            end
          end
        RUBY
      end
    end
  end
end
