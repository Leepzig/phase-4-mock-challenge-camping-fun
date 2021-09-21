class SignupsController < ApplicationController

  def create
    @signup = Signup.new(signup_params)
    if @signup.save
      render json: @signup, :include => [:activity], status: :created
    else
      render json: {"errors": ["validation errors"]}, status: 422
    end
  end

  private

  def signup_params
    params.permit(:time, :activity_id, :camper_id)
  end
end
