class Message < ApplicationRecord
  belongs_to :user

  encrypts :content

  validates :content, presence: true

  after_create_commit -> { broadcast_append_to 'messages' }
end
