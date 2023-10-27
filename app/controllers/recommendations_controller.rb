class RecommendationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    @patient = Patient.find(params[:patient_id])
    @recommendations = @patient.consultation_requests.map(&:recommendation)

    render json: @recommendations
  end

  def create
    @consultation_request = ConsultationRequest.find(params[:request_id])
    random_drug = OpenFDAAPI.random_drug_name

    if random_drug.present?
      @recommendation = @consultation_request.build_recommendation(text: random_drug)
  
      if @recommendation.save
        render json: @recommendation, status: :created
      else
        render json: @recommendation.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Не удалось получить информацию о лекарстве." }, status: :unprocessable_entity
    end
  end
end
