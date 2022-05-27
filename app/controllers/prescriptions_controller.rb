class PrescriptionsController < ApplicationController
    before_action :authenticate_doctor!, only: [:index, :new, :create, :edit, :destroy]
    def index
        if params[:patient_id]
            @prescriptions = Patient.find(params[:patient_id]).prescriptions
          else
            @prescriptions = Prescription.all
        end
    end

    def new
        if params[:patient_id] && !Patient.exists?(params[:patient_id])
          redirect_to patients_path, alert: "Patient not found."
        else
          @prescription = Prescription.new(patient_id: params[:patient_id])
        end
    end

    def create
        @prescription = Prescription.new(pre_params)
        respond_to do |format|
            if @prescription.save
              format.html { redirect_to @prescription, notice: "Prescription was successfully created." }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def show
      @prescription = Prescription.find(params[:id])
    end

    def edit
      if params[:patient_id]
        patient = Patient.find_by(id: params[:patient_id])
        if patient.nil?
        redirect_to patients_path, alert: "Patient not found."
      else
        @prescription = patient.prescriptions.find_by(id: params[:id])
        redirect_to patient_prescription_path(patient), alert: "Prescription not found." if @prescription.nil?
      end
      else
        @prescription = Prescription.find(params[:id])
      end
    end

    def update
      @prescription = Prescription.find_by(id: params[:id])
      @prescription.update(pre_params)
      redirect_to prescription_path(@prescription)
    end

    private
    def pre_params
        params.require(:prescription).permit(:title, :medication, :quantity, :description, :patient_id)
    end
end
