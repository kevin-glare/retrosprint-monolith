# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat, polymorphic: true

  after_create_commit { broadcast_append_to chat }
end
