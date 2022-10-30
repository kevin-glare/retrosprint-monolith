# frozen_string_literal: true

class UsersTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
