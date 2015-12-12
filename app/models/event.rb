class Event < ActiveRecord::Base
  belongs_to :user
  has_many :notifications
  has_many :messages
end
