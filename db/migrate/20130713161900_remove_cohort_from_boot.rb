require_relative '../config'

class UpdateCohort < ActiveRecord::Migration
	def self.up
		remove_column :boots, :cohort
	end

	def self.down
		add_column :boots, :cohort, :integer
	end
end