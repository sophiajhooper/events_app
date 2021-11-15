class AttendeesController < ApplicationController
  before_action :current_user_must_be_attendee_attendee,
                only: %i[edit update destroy]

  before_action :set_attendee, only: %i[show edit update destroy]

  def index
    @q = Attendee.ransack(params[:q])
    @attendees = @q.result(distinct: true).includes(:attendee,
                                                    :event).page(params[:page]).per(10)
  end

  def show; end

  def new
    @attendee = Attendee.new
  end

  def edit; end

  def create
    @attendee = Attendee.new(attendee_params)

    if @attendee.save
      message = "Attendee was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @attendee, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: "Attendee was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    message = "Attendee was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to attendees_url, notice: message
    end
  end

  private

  def current_user_must_be_attendee_attendee
    set_attendee
    unless current_user == @attendee.attendee
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:event_id, :attendee_id, :status)
  end
end
