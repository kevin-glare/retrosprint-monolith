# frozen_string_literal: true

class RetrosController < ApplicationController
  before_action :set_team
  before_action :set_retro, only: %i[show edit update destroy]

  # GET /retros
  def index
    @retros = @team.retros
  end

  # GET /retros/1
  def show
    @messages = @retro.messages
    @chat = @retro
  end

  # GET /retros/new
  def new
    @retro = @team.retros.build
  end

  # GET /retros/1/edit
  def edit; end

  # POST /retros
  def create
    @retro = @team.retros.build

    if @retro.save
      redirect_to [@team, @retro], notice: 'Retro was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /retros/1
  def update
    if @retro.update(retro_params)
      redirect_to [@team, @retro], notice: 'Retro was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /retros/1
  def destroy
    @retro.destroy
    redirect_to team_retros_url(@team), notice: 'Retro was successfully destroyed.'
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_retro
    @retro = @team.retros.find(params[:id])
  end

  def retro_params
    params.require(:retro)
  end
end
