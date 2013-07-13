require_relative '../config'

class RemoveCohortsFromEvents < ActiveRecord::Migration
	def self.up
		remove_column :boots, :cohorts
	end

	def self.down
		add_column :boots, :cohorts, :string
	end
end