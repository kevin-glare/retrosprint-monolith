# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  # GET /teams
  def index
    @teams = current_user.teams
  end

  # GET /teams/1
  def show; end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  def create
    @team = Team.new(team_params)

    ActiveRecord::Base.transaction do
      @team.save
      @team.users_teams.create(user: current_user)
    end

    redirect_to @team, notice: 'Team was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger
    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully destroyed.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:title)
  end
end
