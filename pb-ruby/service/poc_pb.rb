# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: service/poc.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "b2beauty.poc.MessageRequest" do
    optional :message, :string, 1
  end
  add_message "b2beauty.poc.MessageResponse" do
    optional :success, :bool, 1
    optional :message, :string, 2
  end
end

module B2beauty
  module Poc
    MessageRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("b2beauty.poc.MessageRequest").msgclass
    MessageResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("b2beauty.poc.MessageResponse").msgclass
  end
end
