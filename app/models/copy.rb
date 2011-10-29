class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :requests

  validates_uniqueness_of :code
end
