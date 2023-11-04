class Message < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :content, presence: true

  after_create_commit -> { broadcast_append_to "messages" }
end
