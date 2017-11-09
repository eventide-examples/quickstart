require_relative '../init'
require 'eventide/postgres'
require 'securerandom'
require 'pp'


class SomeMessage
  include Messaging::Message

  attribute :some_attribute
  attribute :other_attribute
end


some_message = SomeMessage.new
some_message.some_attribute = 'some value'
some_message.other_attribute = 'other value'


some_id = SecureRandom.uuid
stream_name = "someStream-#{some_id}"


# Write Message
position = Messaging::Postgres::Write.(some_message, stream_name)

# Read Message Data (Raw)
read_message_data = MessageStore::Postgres::Get.(stream_name, position: position, batch_size: 1).first

# Print Message
pp read_message_data
