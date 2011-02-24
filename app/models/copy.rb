class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :requests
end
