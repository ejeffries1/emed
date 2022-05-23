class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    end

    def new
        @patient = Patient.new
        #@patient.prescriptions.build(:prescription)
    end

    def create
        @patient = Patient.new(patient_params)
    end

    def show
        @patient = Patient.find_by(id: params[:id])
        #current_patient = @patient
    end

    private
    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :doctor_id, prescriptions_attributes: [:title, :medication, :quantity, :description])
    end
end
