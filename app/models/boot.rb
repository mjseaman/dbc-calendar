require_relative '../../db/config'

class Boot < ActiveRecord::Base
	belongs_to :cohort
end