require_relative '../helper'
require_relative '../setup_for_tests.rb'

module ROM
  module Viewpoint
    class TestGettingItems < Minitest::Test
      include SetupForTests

      def test_getting_a_folder_and_its_items
        folders = rom.relation(:folders).connect_with(endpoint, user, pass)
        calendar = folders.by_id(:calendar).one
        assert_equal 'Calendar', calendar[:display_name]

        items = rom.relation(:items).connect_with(endpoint, user, pass)
        calendar_items = items.by_folder_id(calendar[:id]).to_a
        assert_equal calendar[:total_count], calendar_items.length
      end

      private

      def rom
        @rom ||= ROM.env
      end

      def endpoint
        ews_config.fetch(:endpoint)
      end

      def user
        ews_config.fetch(:username)
      end

      def pass
        ews_config.fetch(:password)
      end

      def ews_config
        @ews_config ||= YAML.load_file('tmp/ews_credentials.yml').
          each_with_object({}) { |(k,v),h| h[k.to_sym] = v }
      end
    end
  end
end

# TODO:
# connecting_type = Viewpoint::EWS::ConnectingSID[:PSMTP]
# folders.set_impersonation(connection_type, "SomeName@example.com")
