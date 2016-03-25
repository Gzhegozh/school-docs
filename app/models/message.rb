class Message < ActiveRecord::Base
  scope :receiver, -> (user) { where(receiver_id: user.id) }
  scope :sender, -> (user) { where(sender_id: user.id) }
end
