class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages

  def recent_messages(limit: 100)
    messages.order(created_at: :desc).limit(limit).reverse
  end
end
