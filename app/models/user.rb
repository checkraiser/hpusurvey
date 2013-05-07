class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :masinhvien, :name
  
  validates_presence_of :username, :masinhvien

  
  # attr_accessible :title, :body
  def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      case name.to_sym
      when :hovaten
        self.name = value
      when :masinhvien
        self.masinhvien = value
      end
    end
  end
end
