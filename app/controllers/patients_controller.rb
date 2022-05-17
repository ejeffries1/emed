class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    end

    def show
        #binding.pry
        @patient = Patient.find_by(id: params[:id])
        #binding.pry
    end
end
