class Book < ActiveRecord::Base
  #attr_accessible :isbn, :title, :editorial, :description
    
  has_many :authorships
  has_many :authors, :through => :authorships
  has_many :copies, :dependent => :destroy
  
  accepts_nested_attributes_for :copies, :reject_if => :all_blank
  accepts_nested_attributes_for :authors, :reject_if => :all_blank
    
end
