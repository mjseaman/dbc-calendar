require_relative '../../db/config'

class Cohort < ActiveRecord::Base
	has_many :boots
	has_and_belongs_to_many :events
end