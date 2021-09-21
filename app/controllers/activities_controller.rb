class ActivitiesController < ApplicationController


  def index
    activities = Activity.all
    render json: activities
  end

  def destroy
    find_activity
    if @activity
      @activity.destroy
      head :no_content
    else
      render_not_found
    end
  end

  private

  def find_activity
    @activity = Activity.find_by_id(params[:id])
  end

  def render_not_found
    render json: {error: "Activity not found"}, status: :not_found
  end
end
