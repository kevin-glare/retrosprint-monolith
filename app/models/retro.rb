# frozen_string_literal: true

class Retro < ApplicationRecord
  belongs_to :team

  has_many :messages, as: :chat, dependent: :destroy
  has_many :stickers, dependent: :destroy
end
