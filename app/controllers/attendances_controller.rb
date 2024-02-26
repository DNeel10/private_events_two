class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:attendances][:attended_event_id])
    @attendance = current_user.attendances.create(attendance_params)
  end

  def delete
  end

  private
  
  def attendance_params
    params.require(:attendances).permit(:attended_event_id)
  end
end
