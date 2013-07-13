require_relative '../../db/config'

class Event < ActiveRecord::Base
	has_and_belongs_to_many :cohorts
end