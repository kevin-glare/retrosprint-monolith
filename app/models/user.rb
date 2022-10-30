# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :lockable, :recoverable, :rememberable, :validatable

  has_many :users_teams, dependent: :destroy
  has_many :teams, through: :users_teams

  has_many :messages, dependent: :destroy
end
