require 'virtus'

module ROM
  module Viewpoint
    class ClientID
      include Virtus.value_object

      values do
        attribute :endbpoint, String
        attribute :username, String
        attribute :options, Hash
      end
    end
  end
end
