# frozen_string_literal: true

class Sticker < ApplicationRecord
  belongs_to :retro
  belongs_to :user

  after_commit { broadcast_replace_to retro }
end
