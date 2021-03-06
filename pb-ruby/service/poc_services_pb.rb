# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: service/poc.proto for package 'b2beauty.poc'

require 'grpc'
require 'service/poc_pb'

module B2beauty
  module Poc
    module Logging
      class Service

        include GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'b2beauty.poc.Logging'

        # / Used to write a log
        rpc :SendMessage, MessageRequest, MessageResponse
        rpc :ReceiveMessage, MessageRequest, MessageResponse
      end

      Stub = Service.rpc_stub_class
    end
  end
end
