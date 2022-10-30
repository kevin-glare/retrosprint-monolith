# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :retros, dependent: :destroy

  has_many :users_teams, dependent: :destroy
  has_many :users, through: :users_teams

  validates :title, presence: true

  after_create_commit { broadcast_append_to 'teams' }
end
