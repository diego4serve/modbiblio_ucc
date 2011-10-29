class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :copy
  
  validates_presence_of :user
  validates_presence_of :copy
  validates_presence_of :request_date
end
