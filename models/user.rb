class User < ActiveRecord::Base
    has_secure_password
    has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
    has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
end

# u = User.new

# u.received_messages
# Message.find_by(id: u.receiver_id)