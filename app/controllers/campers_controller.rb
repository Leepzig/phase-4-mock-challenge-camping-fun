class CampersController < ApplicationController
  before_action :find_camper, only: [:show]

def index
  campers = Camper.all
  render json: campers
end

def show
  if @camper
    render json: @camper, serializer: CamperActivitySerializer
  else
    render_not_found
  end
end

def create
  @camper = Camper.new(camper_params)
  if @camper.save
    render json: @camper, status: :created
  else
    render json: { errors: ["validation errors"]}, status: 422
  end
end
  private

  def find_camper
    @camper = Camper.find_by_id(params[:id])
  end

  def render_not_found
    render json: {error: "Camper not found"}, status: :not_found
  end

  def camper_params
    params.permit(:name, :age)
  end
end
