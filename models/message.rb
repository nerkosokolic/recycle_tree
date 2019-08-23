class Message < ActiveRecord::Base
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
end

# m = Message.new

# m.receiver
# User.find_by(id: m.receiver_id)