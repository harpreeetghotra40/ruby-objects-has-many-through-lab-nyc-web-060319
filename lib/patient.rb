require_relative 'doctor'
require_relative 'appointment'

class Patient
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        Appointment.new(self, date, doctor)
    end

    def doctors
        all_doctors = []
        Appointment.all.each do |appointment| 
            if appointment.patient == self
                all_doctors << appointment.doctor
            end
        end
        all_doctors
    end

    def appointments
        Appointment.all.select {|appointment| appointment.patient == self }
    end
end