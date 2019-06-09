require_relative 'appointment'
require_relative 'patient'

class Doctor
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all << self
    end

    def new_appointment(patient, date)
        Appointment.new(patient, date, self)
    end

     def appointments
        Appointment.all.select { |appointment| appointment.doctor = self}
    end

    def patients
        all_patients = []
        Appointment.all.each do |appointment|
            if appointment.doctor == self
                all_patients << appointment.patient
            end
        end
        all_patients
    end
end