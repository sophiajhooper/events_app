class Api::V1::AttendeesController < Api::V1::GraphitiController
  def index
    attendees = AttendeeResource.all(params)
    respond_with(attendees)
  end

  def show
    attendee = AttendeeResource.find(params)
    respond_with(attendee)
  end

  def create
    attendee = AttendeeResource.build(params)

    if attendee.save
      render jsonapi: attendee, status: :created
    else
      render jsonapi_errors: attendee
    end
  end

  def update
    attendee = AttendeeResource.find(params)

    if attendee.update_attributes
      render jsonapi: attendee
    else
      render jsonapi_errors: attendee
    end
  end

  def destroy
    attendee = AttendeeResource.find(params)

    if attendee.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: attendee
    end
  end
end
