class PrescriptionsController < ApplicationController
    #before_action :authenticate_doctor!
    #before_action :authenticate_patient!
    def index
        if params[:patient_id]
            @prescriptions = Patient.find(params[:patient_id]).prescriptions
          else
            @prescriptions = Prescription.all
        end
    end

    def new
        @prescription = Prescription.new(patient_id: params[:patient_id])
    end

    def create
        @prescription = Prescription.new(pre_params)
        #binding.pry
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

    private
    def pre_params
        params.require(:prescription).permit(:title, :medication, :quantity, :description, :patient_id)
    end
end
