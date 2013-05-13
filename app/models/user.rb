class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :masinhvien, :name

  validates_presence_of :username, :masinhvien

  scope :by_masinhvien,  lambda { |msv|
    where('lower(masinhvien) = ?', msv.downcase)
  }

  def self.get_status(msv)
    us = User.by_masinhvien(msv)
    return -1 if us.empty?

    sv = Sinhvien.by_masinhvien(msv)  
    return -2 if sv.empty?

    ssv = sv.by_voted
    return -3 if ssv.empty?

    return 1
  end
  # attr_accessible :title, :body
  def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      case name.to_sym
      when :hovaten
        self.name = value
      when :masinhvien
        self.masinhvien = value.downcase
      end
    end
  end
end
