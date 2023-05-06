class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        auditions.map do |t|
            t.actor
        end

    end

    def locations 
        auditions.map do |t|
            t.locations
        end 
    end 

    def lead 
        self.find(hired: true) || "no actor has been hired for this role "
    end

    def understudy 
        auditions.find(hired: true) || "no actor has been hired for this role "
    end 
  end