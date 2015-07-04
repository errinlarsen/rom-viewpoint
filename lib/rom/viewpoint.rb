require 'viewpoint'
require 'rom'

module ROM
  module Viewpoint
    Error = Class.new(::StandardError)

    ConnectionError = Class.new(Error)
    ClientConnectionError = Class.new(ConnectionError)

    ClientNotConnectedError = Class.new(Error)
    ClientMissingError = Class.new(Error)
  end
end

require 'rom/viewpoint/version'
require 'rom/viewpoint/gateway'
require 'rom/viewpoint/relation'

ROM.register_adapter(:viewpoint, ROM::Viewpoint)
