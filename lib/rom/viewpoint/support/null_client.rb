module ROM
  module Viewpoint
    class NullClient
      attr_reader :client_pool,
      # Viewpoint::EWS#methods:
        :logger, :remove_impersonation, :set_impersonation,
      # Viewpoint::EWS::FolderAccessors#methods:
        :find_folders, :folders, :get_folder, :get_folder_by_name,
        :make_folder, :mkfolder, :sync_folders,
      # Viewpoint::EWS::ItemAccessors#methods:
        :copy_items, :export_items, :find_items, :get_item, :get_items,
        :move_items,
      # Viewpoint::EWS::MessageAccessors#methods:
        :draft_message, :send_message,
      # Viewpoint::EWS::MailboxAccessors#methods:
        :get_user_availability, :search_contacts,
      # Viewpoint::EWS::PushSubscriptionAccessors#methods:
        :parse_send_notification,
      # Viewpoint::EWS::CalendarAccessors#methods:
        :event_busy_type, :event_end_time, :event_start_time,
      # Viewpoint::EWS::RoomAccessors#methods:
        :get_rooms, :room_email, :room_name,
      # Viewpoint::EWS::RoomlistAccessors#methods:
        :get_room_lists, :roomlist_email, :roomlist_name,
      # Viewpoint::EWS::ConvertAccessors#methods:
        :convert_id,
      # Viewpoint::EWSClient#methods:
        :ews, :endpoint, :set_auto_deepen, :set_time_zone, :username
      attr_accessor :auto_deepen

      def initialize(client_pool)
        @client_pool = client_pool
      end

      def connect(endpoint, username, password, ews_options={})
        client_pool.client(endpoint, username, password, ews_options)
      end
    end
  end
end
