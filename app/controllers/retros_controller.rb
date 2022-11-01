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
    @messages = @retro.messages.includes(:user)
    @chat = @retro
    @stickers = {}

    @retro.stickers.includes(:user).group_by(&:user).each do |user, stickers|
      @stickers[user.full_name] ||= { good: [], bad: [], think: [] }

      stickers.each do |sticker|
        case sticker
        when Stickers::Good
          @stickers[user.full_name][:good] << sticker
        when Stickers::Bad
          @stickers[user.full_name][:bad] << sticker
        when Stickers::Think
          @stickers[user.full_name][:think] << sticker
        else
          Rails.logger.error "BAD STICKER: #{sticker.inspect}"
        end
      end
    end
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

    ActiveRecord::Base.transaction do
      @team.users.each do |user|
        %w[Stickers::Bad Stickers::Good Stickers::Think].each do |type|
          3.times { |_| @retro.stickers.build(user:, type:) }
        end
      end

      @retro.save
    end

    redirect_to [@team, @retro], notice: 'Retro was successfully created.'
  rescue ActiveRecord::RecordInvalid
    render :new, status: :unprocessable_entity
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
