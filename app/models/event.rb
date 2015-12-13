class Event < ActiveRecord::Base
  has_many :notifications
  has_many :messages
end
