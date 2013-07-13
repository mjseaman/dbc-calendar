require_relative '../config'

class UpdateCohort < ActiveRecord::Migration
	def self.up
		rename_column :cohorts, :last_name, :name
	end

	def self.down
		rename_column :cohorts, :name, :last_name
	end
end